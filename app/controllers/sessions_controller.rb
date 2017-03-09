class SessionsController < ApplicationController

  def new
    if current_user
      redirect_to "/users/#{current_user.id}"
    else
      render "new.html.erb"
    end
  end

  def create
    user = User.find_by(user_name: params[:user_name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully Logged In!"
      redirect_to "/profiles/#{user.profile.id}"
    else
      flash[:warning] = "Invalid Email or Password - Please Try Again!"
      redirect_to "/login"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Successfully Logged Out!"
    redirect_to "/login"
  end

end
