class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.create(user_id: current_user.id, trip_id: params[:trip_id])
    flash[:success] = "Trip successfully bookmarked!"
    redirect_to "/profiles/#{current_user.profile.id}"
  end

  def destroy
    @favorite = Favorite.find_by(id: params[:id])
    @favorite.destroy
    flash[:success] = "Trip successfully removed!"
    redirect_to "/profiles/#{current_user.profile.id}"
  end

end
