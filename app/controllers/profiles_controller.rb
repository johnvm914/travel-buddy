class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def new
    if current_user.profile
      redirect_to "/profiles/#{current_user.profile.id}"
    else
      @profile = Profile.new
      render "new.html.erb"
    end
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      flash[:success] = "Profile Successfully Created!"
      redirect_to "/profiles/#{current_user.profile.id}"
    else
      flash[:warning] = "Profile Not Created...Please Try Again!"
      render "new.html.erb"
    end
  end

  def show
    @profile = Profile.find_by(id: params[:id])
    if @profile
      render "show.html.erb"
    else
      flash[:warning] = "Profile Has Not Been Created Yet!"
      redirect_to "/pages"
    end
  end

  def edit
    @profile = Profile.find_by(id: params[:id])
    if @profile && (@profile.user.id == current_user.id)
      render "edit.html.erb"
    else
      redirect_to "/profiles/#{current_user.profile.id}"
    end
  end

  def update
    @profile = Profile.find_by(id: params[:id])
    @profile.assign_attributes(profile_params)
    if @profile.save
      flash[:success] = "Profile Successfully Updated!"
      redirect_to "/profiles/#{@profile.id}"
    else
      flash[:warning] = "Profile Not Updated...Please Try Again!"
      render "edit.html.erb"
    end
  end

  def change_pic
    @profile = Profile.find_by(id: params[:id])
    @profile.assign_attributes(profile_params)
    if @profile.save
      flash[:success] = "Profile Pic Successfully Updated!"
      redirect_to "/profiles/#{@profile.id}"
    else
      flash[:warning] = "Profile Pic Not Updated...Please Try Again!"
      render "edit.html.erb"
    end
  end

  def destroy
    @profile = Profile.find_by(id: params[:id])
    @profile.destroy
    flash[:success] = "Profile Successfully Deleted!"
    redirect_to "/profiles/new"
  end

  private

    def profile_params
      params.permit(:profile_pic, :age, :location, :bio).merge(user_id: current_user.id)
    end
end
