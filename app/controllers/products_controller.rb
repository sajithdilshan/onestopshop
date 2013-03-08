class ProductsController < ApplicationController
	before_filter :login_required, :only => [:index,:new,:edit]

	def index

		if params[:per_page]
			@per_page = params[:per_page]
		else
			@per_page = 15
		end

		if params[:search].present? and params[:column_name].present?
			@products = Product.search_products(params[:column_name], params[:search],params[:page],@per_page)

			if @products.nil?
				@products = Product.all
				flash[:alert] = "No records found."
			end
		else
			@products = Product.paginate(:page => params[:page], :per_page => @per_page)
		end
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(params[:product])

		if @product.save
			flash[:notice] = "Product with ID #{@product.id} was successfully added."
			redirect_to new_product_path
		else
			flash[:alert] = "Error adding Product."
			redirect_to new_product_path
		end
	end

	def edit
		@product = Product.find params[:id]
	end

	def update
		@product = Product.find params[:id]
		@product.update_attributes!(params[:product])
		flash[:notice] = "Product #{@product.id} Updated Successfully"
		redirect_to products_path
	end

	def destroy
		@product = Product.find params[:id]
		@product.destroy
		flash[:notice] = "Product with ID #{@product.id} removed."
		redirect_to products_path
	end

end
