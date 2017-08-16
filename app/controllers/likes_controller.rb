class LikesController < ApplicationController
  def toggle
    if params[:post_id]
      @item = Post.find(params[:post_id])
    else params[:comment_id]
      @item = Comment.find(params[:comment_id])
    end

    @like = current_user.toggle_like! @item

    respond_to do |format|
      format.js
      format.html {redirect_back fallback_location: root_path}
    end
  end
end
