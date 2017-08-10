class FriendshipsController < ApplicationController
  # expect params[:friend_id]
  def create
    current_user.friendships.create!(friendship_params)
    redirect_to users_path
  end

  def destroy
    fs = current_user.friendships.where(friend: params[:user_id])
    fs.first.delete
    
    redirect_to friends_path
  end
  
  private 
  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end