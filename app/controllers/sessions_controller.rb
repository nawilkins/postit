class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      current_user
      flash[:notice] = "You have logged in as #{@current_user.username}."
      redirect_to root_path
    else
      flash[:error] = "There is something wrong with your login credentials"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have successfully logged out"
    redirect_to root_path
  end

end