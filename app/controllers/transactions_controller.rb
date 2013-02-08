class TransactionsController < ApplicationController

	def index
		if params[:search].present? and params[:column_name].present?
			@transactions = Transaction.search_transactions(params[:column_name], params[:search])
		
			if @transactions.nil?
				@transactions = Transaction.all
				flash[:alert] = "No records found."
			end
		else
			@transactions = Transaction.all
		end

	end

	def show
		id = params[:id]
		@product = {}
		@transaction = Transaction.find(id)
		@orders = Order.all(:conditions => {:transaction_id => id})
		@orders.each do |item|
			p = Product.find_by_id(item.product_id)
			@product[item.product_id] = p
		end
		@customer = Customer.find_by_id(@transaction.customer_id)

	end

end