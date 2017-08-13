class LikesController < ApplicationController
  def create
    current_user.likes.build(like_params)
    current_user.save!
    redirect_back(fallback_location: root_path)
  end

  private
  def like_params
    params.require(:like).permit(:post_id)
  end
end
