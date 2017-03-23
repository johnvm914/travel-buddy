class ProfilesController < ApplicationController

  def new
    if current_user && current_user.profile
      redirect_to "/profiles/#{current_user.profile.id}"
    elsif current_user
      @profile = Profile.new
      render "new.html.erb"
    else
      redirect_to "/login"
    end
  end

  def create
    @profile = Profile.new(profile_pic: params[:profile_pic], age: params[:age], location: params[:location], bio: params[:bio], user_id: current_user.id )
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
      @conversations = current_user.mailbox.conversations
      render "show.html.erb"
    else
      redirect_to "/profiles/new"
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
    @profile.assign_attributes(age: params[:age], location: params[:location], bio: params[:bio], user_id: current_user.id)
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
    @profile.assign_attributes(profile_pic: params[:profile_pic])
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
end
