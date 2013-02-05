class CustomersController < ApplicationController
	def index
		if params[:sort] == 'type'
			@customers = Customer.order("customer_type").page(params[:page])
		else
			@customers = Customer.paginate :page => params[:page]
		end
	end

	def show
		id = params[:id]
		@customer = Customer.find(id)
	end


end