class TripsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:destination]
      destination = params[:destination].downcase
      @trips = Trip.where("destination LIKE ? AND user_id != ?", "%#{destination}%", current_user.id)
    elsif params[:date]
      date = params[:date]
      @trips = Trip.where("begin_date <= ? AND end_date >= ? AND user_id != ?", date, date, current_user.id)
    end
    render "index.html.erb"
  end

  def new
    @trip = Trip.new
    render "new.html.erb"
  end

  def create
    @trip = Trip.new(trip_params)
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
    @trip.assign_attributes(trip_params)
    if @trip.save
      flash[:success] = "Trip Successfully Updated!"
      redirect_to "/trips/#{@trip.id}"
    else
      flash[:warning] = "Trip Not Updated...Please Try Again!"
      render "edit.html.erb"
    end
  end

  def destroy
    @trip = Trip.find_by(id: params[:id])
    @trip.destroy
    flash[:success] = "Trip Successfully Deleted!"
    redirect_to "/profiles/#{current_user.profile.id}"
  end

  private

    def trip_params
      params[:destination] = params[:destination].downcase
      params.permit(:trip_type, :destination, :date_type, :begin_date, :end_date, :budget, :description, :wish_list).merge(user_id: current_user.id)
    end
end
