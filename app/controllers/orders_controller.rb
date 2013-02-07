class OrdersController < ApplicationController
	def index
		@cart = current_cart
	end

	def new
		@cart = current_cart
		if @cart.line_items.empty?
			redirect_to orders_path, :notice => "Your cart is empty"
			return
		end

	end


	def create
		cart = current_cart
		customer_id = params[:customer_id]
		customer = Customer.find_by_id(customer_id)

		if customer.nil?
			flash[:alert] = "Customer doesnot exist"
			redirect_to new_order_path
			return
		end

		transaction = Transaction.create!(:customer_id => customer_id, :order_date => Time.now.to_s, :total_cost => cart.total_price, :paid => false)

		cart.line_items.each do |item|
			order = Order.create!(:transaction_id => transaction.id, :product_id => item.product.id, :quantity => item.quantity, :cost => item.total_price)
		end

		balance = customer.remaining_credit.to_f - cart.total_price.to_f
		customer.update_attributes(:remaining_credit => balance)

		Cart.destroy(session[:cart_id])
		session[:cart_id] = nil

		redirect_to transaction_path(transaction.id)

	end
	
end