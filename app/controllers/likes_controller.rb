class LikesController < ApplicationController
  def toggle
    if params[:post_id]
      item = Post.find(params[:post_id])
    else params[:comment_id]
      item = Comment.find(params[:comment_id])
    end

    current_user.toggle_like! item
    redirect_back fallback_location: root_path
  end

  private
  def like_params
    params.require(:like).permit(:post_id, :comment_id)
  end
end
