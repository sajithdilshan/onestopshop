class LineItemsController < ApplicationController
  before_filter :login_required, :only => [:index,:show,:new,:edit]
  # GET /line_items
  # GET /line_items.json
  def index
    redirect_to orders_path

  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
    redirect_to orders_path
  end

  # GET /line_items/new
  # GET /line_items/new.json
  def new
    redirect_to orders_path
  end

  # GET /line_items/1/edit
  def edit
    redirect_to orders_path
  end

  # POST /line_items
  # POST /line_items.json
  def create
    @cart = current_cart
    product = Product.find_by_id(params[:product_id])

    if product.nil?
      flash[:alert] = "Product not found."
      redirect_to orders_path
      return
    end

    if not params[:qnt].present?
      flash[:alert] = "Quantity cannot be empty."
      redirect_to orders_path
      return
    end

    if product.remaining_quantity < params[:qnt].to_i
      flash[:alert] = "Quantity not avalable."
      redirect_to orders_path
      return
    end

    @line_item = @cart.add_product(product.id, params[:qnt])
    product.update_attributes(:remaining_quantity => (product.remaining_quantity - params[:qnt].to_i))

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to orders_path }
        format.js {@current_item = @line_item}
        format.json { render json: @line_item, status: :created, location: @line_item }
      else
        format.html { render action: "new" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /line_items/1
  # PUT /line_items/1.json
  def update
    redirect_to orders_path
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item = LineItem.find(params[:id])
    product = Product.find_by_id(@line_item.product.id)
    product.update_attributes(:remaining_quantity => (product.remaining_quantity + @line_item.quantity))
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to(orders_path) }
      format.json { head :ok }
    end
  end
end
