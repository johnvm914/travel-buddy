class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @favorite = Favorite.create(favorite_params)
    flash[:success] = "Trip successfully bookmarked!"
    redirect_to "/profiles/#{current_user.profile.id}"
  end

  def destroy
    @favorite = Favorite.find_by(id: params[:id])
    @favorite.destroy
    flash[:success] = "Trip successfully removed!"
    redirect_to "/profiles/#{current_user.profile.id}"
  end

  private

    def favorite_params
      params.permit(:trip_id).merge(user_id: current_user.id)
    end

end
