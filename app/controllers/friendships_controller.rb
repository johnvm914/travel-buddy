class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    friendship = Friendship.new(friendship_params)
    @friend = User.find_by(id: params[:friend_id])
    if friendship.save
      flash[:success] = "You are now following #{@friend.user_name}!"
    else
      flash[:warning] = "Something went wrong...follow request failed!"
    end
    redirect_to "/profiles/#{current_user.profile.id}"
  end

  def destroy
    friendship = Friendship.find_by(friend_id: params[:id])
    @user = User.find_by(id: params[:id])
    if friendship.destroy
      flash[:success] = "You are no longer following #{@user.user_name}."
    else
      flash[:warning] = "Something went wrong...unfollow request failed."
    end
    redirect_to "/profiles/#{current_user.profile.id}"
  end

  private

    def friendship_params
      params.permit(:friend_id).merge(user_id: current_user.id)
    end
end
