class ProfilesController < ApplicationController

  def new
    if current_user
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
      redirect_to "/profiles/#{current_user.id}"
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
    render "edit.html.erb"
  end

  def update
    @profile = Profile.find_by(id: params[:id])
    @profile.assign_attributes(image: params[:image], age: params[:age], location: params[:location], bio: params[:bio], user_id: current_user.id)
    if @profile.save
      flash[:success] = "Profile Successfully Updated!"
      redirect_to "/profiles/#{current_user.id}"
    else
      flash[:warning] = "Profile Not Updated...Please Try Again!"
      render "edit.html.erb"
    end
  end

  def destroy
  end
end
