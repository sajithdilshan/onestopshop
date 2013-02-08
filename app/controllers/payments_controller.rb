class PaymentsController < ApplicationController

  def index

    if params[:per_page]
      @per_page = params[:per_page]
    else
      @per_page = 15
    end 

    if params[:search].present? and params[:column_name].present?
      @payments = Payment.search_payments(params[:column_name], params[:search],params[:page],@per_page)
    
      if @payments.nil?
        @payments = Payment.all
        flash[:alert] = "No records found."
      end
    else
      @payments = Payment.paginate(:page => params[:page], :per_page => @per_page)
    end
  end


	def new
    @payment = Payment.new
	end

	def create
    payment = params[:payment]

    if not Customer.find_by_id(payment['customer_id']).nil?
      @customer = Customer.find_by_id(payment['customer_id'])
      if not @customer.customer_type == "mailorder"
        balance = @customer.remaining_credit.to_f + payment['amount'].to_f
        @customer.update_attributes(:remaining_credit => balance)
      end
    else
      flash[:alert] = "Customer not found."
      redirect_to new_payment_path
      return
    end

    payment["paid_date"] = Time.now.to_s

    @temp = Payment.new(payment)
    if @temp.save
      flash[:notice] = "Payment was successfull"
      redirect_to new_payment_path
    else
      flash[:alert] = "Error making payment."
      redirect_to new_payment_path
    end
	end

end