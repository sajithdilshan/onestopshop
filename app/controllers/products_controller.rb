class ProductsController < ApplicationController
	def index
		if params[:sort] == 'type'
			@products = Product.order("product_type").page(params[:page])
		else
			@products = Product.paginate :page => params[:page]
		end
	end
end
