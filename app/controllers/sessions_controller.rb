class SessionsController < ApplicationController
  def new
    redirect_to root_url if session[:user_id]
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Login successfully"
    else
      flash[:error] = "Login failure: username and/or password incorrect"
    end

    render "home/index"
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been logged out"
    redirect_to root_url
  end
end
