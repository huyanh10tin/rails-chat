class PostsController < ApplicationController
  def create
    @post = current_user.posts.build post_params

    if @post.save
      redirect_back fallback_location: root_path
    else
      flash[:error] = "Could not create."
      redirect_back fallback_location: root_path
    end
  end

  def destroy
    Post.find(params[:post_id]).destroy
    flash[:success] = "Post deleted"
    redirect_back fallback_location: root_path
  end

  private
  def post_params
    params.require(:post).permit(:body, :wall_id)
  end
end
