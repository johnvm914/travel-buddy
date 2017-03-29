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

  end



end
