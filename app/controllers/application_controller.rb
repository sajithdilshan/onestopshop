class ApplicationController < ActionController::Base
  protect_from_forgery

  # filter_parameter_logging :password, :password_confirmation  
  helper_method :current_employe_session, :current_employe

  private

    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end

    def current_employe_session  
      return @current_employe_session if defined?(@current_employe_session)
      @current_employe_session = EmployeSession.find 
    end  
  
    def current_employe          
      return @current_employe if defined?(@current_employe)
      @current_employe = current_employe_session && current_employe_session.record
    end  

    def login_required  
      unless current_employe 
        flash[:error] = 'You must be logged in to view this page.'  
        redirect_to new_employe_session_path  
      end  
    end

end
