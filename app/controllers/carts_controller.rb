class CartsController < ApplicationController
  before_filter :login_required, :only => [:index,:show,:new,:edit]
  # GET /carts
  # GET /carts.json
  def index
    redirect_to orders_path
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    begin
      @cart = Cart.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to orders_url, :notice => 'Invalid cart'
    else
      respond_to do |format|
        format.html # show.html.erb
        format.xml { render :xml => @cart }
      end
    end

  end

  # GET /carts/new
  # GET /carts/new.json
  def new
    redirect_to orders_path
  end

  # GET /carts/1/edit
  def edit
    redirect_to orders_path
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(params[:cart])

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render json: @cart, status: :created, location: @cart }
      else
        format.html { render action: "new" }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /carts/1
  # PUT /carts/1.json
  def update
    redirect_to orders_path
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart = current_cart
    @cart.line_items.each do |item|
      product = Product.find_by_id(item.product.id)
      product.update_attributes(:remaining_quantity => (product.remaining_quantity + item.quantity))
    end
    @cart.destroy
    session[:cart_id] = nil

    respond_to do |format|
      format.html { redirect_to(orders_path, :notice => 'Your cart is currently empty') }
      format.json { head :ok }
    end
  end
end
