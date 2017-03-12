class TripsController < ApplicationController

  def index
    destination = params[:destination]
    @trips = Trip.where("destination LIKE ? AND user_id != ?", "%#{destination}%", current_user.id)
    render "index.html.erb"
  end

  def new
    @trip = Trip.new
    render "new.html.erb"
  end

  def create
    @trip = Trip.new(user_id: current_user.id, trip_type: params[:trip_type], destination: params[:destination], begin_date: params[:begin_date], end_date: params[:end_date], budget: params[:budget], description: params[:description], wish_list: params[:wish_list])
    if @trip.save
      flash[:success] = "Trip Successfully Created!"
      redirect_to "/trips/#{@trip.id}"
    else
      flash[:warning] = "Trip Not Created...Please Try Again!"
      render "new.html.erb"
    end
  end

  def show
    @trip = Trip.find_by(id: params[:id])
    render "show.html.erb"
  end

  def edit
    @trip = Trip.find_by(id: params[:id])
    if @trip && (@trip.user.id == current_user.id)
      render "edit.html.erb"
    else
      redirect_to "/users/#{current_user.id}"
    end
  end

  def update
    @trip = Trip.find_by(id: params[:id])
    @trip.assign_attributes(trip_type: params[:trip_type], destination: params[:destination], begin_date: params[:begin_date], end_date: params[:end_date], budget: params[:budget], description: params[:description], wish_list: params[:wish_list])
    if @trip.save
      flash[:success] = "Trip Successfully Updated!"
      redirect_to "/trips/#{@trip.id}"
    else
      flash[:warning] = "Trip Not Updated...Please Try Again!"
      render "/trips/#{@trip.id}/edit"
    end
  end

  def destroy
    @trip = Trip.find_by(id: params[:id])
    @trip.destroy
    flash[:success] = "Trip Successfully Deleted!"
    redirect_to "/users/#{current_user.id}"
  end
end
