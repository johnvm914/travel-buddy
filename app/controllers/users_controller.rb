class UsersController < ApplicationController

  def new
    if current_user
      redirect_to "/pages"
    else
      @user = User.new
      render "new.html.erb"
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Account Successfully Created!"
      redirect_to "/profiles/new"
    else
      flash[:warning] = "Account Not Created...Please Try Again!"
      redirect_to "/signup"
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user && (@user.id == current_user.id)
      render "show.html.erb"
    else
      redirect_to "/users/#{current_user.id}"
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
    if @user && (@user.id == current_user.id)
      render "edit.html.erb"
    else
      redirect_to "/users/#{current_user.id}"
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.assign_attributes(user_params)
    if @user.save
      flash[:success] = "Account Successfully Updated!"
      redirect_to "/users/#{@user.id}"
    else
      flash[:warning] = "Account Not Updated...Please Try Again!"
      render "edit.html.erb"
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    flash[:success] = "Account Successfully Deleted!"
    redirect_to "/signup"
  end

  private

    def user_params
      params.permit(:first_name, :last_name, :email, :user_name, :password, :password_confirmation)
    end
  
end
