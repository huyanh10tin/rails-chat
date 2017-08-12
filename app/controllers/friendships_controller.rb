class FriendshipsController < ApplicationController
  def create
    current_user.friendships.create!(friendship_params)
    current_user.friendships.last.confirm
    Friendship.create!(user_id: params[:friendship][:friend_id], friend_id: params[:friendship][:user_id])

    redirect_to users_path
  end

  def destroy
    current_user.friendships.where(friend: params[:user_id]).first.delete
    Friendship.where(user_id: params[:user_id], friend_id: current_user.id)[0].destroy
    redirect_to friends_path
  end

  def confirm
    friendship = current_user.friendships.where(friend: params[:friend])[0]
    friendship.confirm
    friendship.save!
    friendship = Friendship.where("user_id = ? AND friend_id = ?", params[:friend], current_user.id)[0]
    friendship.confirm
    friendship.save!
    redirect_to received_requests_path
  end

  def received_requests
    @requests = current_user.received_requests
  end

  def sent_requests
    @sent_requests = current_user.sent_requests
  end

  private
  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id, :status)
  end
end
