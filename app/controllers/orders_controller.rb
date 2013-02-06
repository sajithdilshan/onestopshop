class OrdersController < ApplicationController
	def index
		if params[:search].present? and params[:column_name].present?
			@orders = Order.search_orders(params[:column_name], params[:search])
		
			if @orders.nil?
				@orders = Order.all
				flash[:alert] = "No records found."
			end
		else
			@orders = Order.all
		end
	end

	def new

	end

	def create
		customer_id = params[:customer_id]
		product = params[:product_id]
		product_hash ={}
		total = 0

		if customer_id.present? and product.present?
			if not Customer.find_by_id(customer_id).nil?
				customer = Customer.find(customer_id)
				product = product.split

				product.each do |t|
					p_id, quantity = t.split '-'
					product_hash[p_id] = quantity
				end

				transaction = Transaction.create!(:customer_id => customer_id, :order_date => Time.now.to_s, :total_cost => 0, :paid => false)

				product_hash.keys.each do |key|
					p = Product.find_by_id(key)
					if not p.nil? #if product is present
						if p.remaining_quantity.to_i > product_hash[key].to_i #if quantity is avalable
							cost = p.rate.to_f * product_hash[key].to_f
							total = total + cost
							order = Order.create!(:transaction_id => transaction.id, :product_id => key, :quantity => product_hash[key], :cost => cost)
							qnt = p.remaining_quantity.to_i - product_hash[key].to_i
							p.update_attributes(:remaining_quantity => qnt)
						else
							transaction.destroy
							flash[:alert] = "Quantity mismatch."
							redirect_to new_order_path
							return
						end
					else
						transaction.destroy
						flash[:alert] = "Product not found."
						redirect_to new_order_path
						return
					end
				end

				transaction.update_attributes(:total_cost => total)

				balance = customer.remaining_credit.to_f - total.to_f
				customer.update_attributes(:remaining_credit => balance)
			
			else
				flash[:alert] = "Customer not found."
				redirect_to new_order_path
				return
			end
		else
			flash[:alert] = "Either input was empty."
			redirect_to new_order_path
			return
		end
		redirect_to transaction_path(transaction.id)

	end


end