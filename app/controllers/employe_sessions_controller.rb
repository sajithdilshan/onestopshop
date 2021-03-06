class EmployeSessionsController < ApplicationController
  def new
    @employe_session = EmployeSession.new
  end

  def create
    @employe_session = EmployeSession.new(params[:employe_session])
    if @employe_session.save
      flash[:notice] = "Login Successful"
      redirect_to products_path
    else
      flash[:alert] = "Login Unsuccessful. Invalid username or password"
      redirect_to new_employe_session_path 
    end
  end

   def destroy
    @employe_session = EmployeSession.find
    @employe_session.destroy
    flash[:notice] = "Logout Successful"
    redirect_to new_employe_session_path  
  end

end
