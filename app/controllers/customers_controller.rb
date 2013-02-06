class CustomersController < ApplicationController
	def index
		if params[:search].present? and params[:column_name].present?
			@customers = Customer.search_customers(params[:column_name], params[:search])
		
			if @customers.nil?
				@customers = Customer.all
				flash[:alert] = "No records found."
			end
		else
			@customers = Customer.all
		end
	end

	def show
		id = params[:id]
		@customer = Customer.find(id)
	end

	def new
		@customer = Customer.new
	end

	def create
		@temp = params[:customer]
		if @temp.has_key? 'initial_credit'
			@temp['remaining_credit'] = @temp['initial_credit']
		end
		@customer = Customer.new(@temp)
		if @customer.save
			flash[:notice] = "Customer named #{@customer.first_name} was successfully added."
			redirect_to customer_path(@customer.id)
		else
			flash[:alert] = "Error adding customer."
			redirect_to new_customer_path
		end
	end

	def edit
		@customer = Customer.find params[:id]
	end

	def update
		@customer = Customer.find params[:id]
		@customer.update_attributes!(params[:customer])
		flash[:notice] = " #{@customer.first_name}'s details updated successfully"
		redirect_to customer_path
	end

	def destroy
		@customer = Customer.find params[:id]
		@customer.destroy
		flash[:notice] = "#{@customer.first_name}'s details permanently removed."
		redirect_to customers_path
	end
end