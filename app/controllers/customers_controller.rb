class CustomersController < ApplicationController
	before_filter :login_required, :only => [:index,:show,:new,:edit]

	def index
		if params[:per_page]
			@per_page = params[:per_page]
		else
			@per_page = 15
		end

		if params[:search].present? and params[:column_name].present?
			@customers = Customer.search_customers(params[:column_name], params[:search],params[:page],@per_page)

			if @customers.nil?
				@customers = Customer.all
				flash[:alert] = "No records found."
			end
		else
			@customers = Customer.paginate(:page => params[:page], :per_page => @per_page)
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
		redirect_to customers_path
		# @customer = Customer.find params[:id]
		# @customer.destroy
		# flash[:notice] = "#{@customer.first_name}'s details permanently removed."
		# redirect_to customers_path
	end
end