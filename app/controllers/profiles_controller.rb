class ProfilesController < ApplicationController

  def new
    if current_user.profile
      redirect_to "/profiles/#{current_user.id}"
    else
      @profile = Profile.new
      render "new.html.erb"
    end
  end

  def create
    @profile = Profile.new(image: params[:image], age: params[:age], location: params[:location], bio: params[:bio], user_id: current_user.id )
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
    render "show.html.erb"
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
    @profile.assign_attributes(image: params[:image], age: params[:age], location: params[:location], bio: params[:bio], user_id: current_user.id)
    if @profile.save
      flash[:success] = "Profile Successfully Updated!"
      redirect_to "/profiles/#{@profile.id}"
    else
      flash[:warning] = "Profile Not Updated...Please Try Again!"
      render "edit.html.erb"
    end
  end

  def destroy
    @profile = Profile.find_by(id: params[:id])
    @profile.destroy
    flash[:success] = "Profile Successfully Deleted!"
    redirect_to "/users/#{current_user.id}"
  end

end
