class UsersController < ApplicationController

  def new
    render "new.html.erb"
  end

  def create
    user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], user_name: params[:user_name], password: params[:password], password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      flash[:success] = "Account Successfully Created!"
      redirect_to "/users/#{user.id}"
    else
      flash[:warning] = "Account Not Created...Please Try Again!"
      redirect_to "/signup"
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
end
