class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.create(user_id: current_user.id, trip_id: params[:trip_id])
    redirect_to "/profiles/#{current_user.id}"
  end

end
