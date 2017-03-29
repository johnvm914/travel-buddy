class FriendshipsController < ApplicationController

  def create
    friendship = Friendship.new(user_id: current_user.id, friend_id: params[:friend_id])
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

end
