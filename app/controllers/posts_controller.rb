class PostsController < ApplicationController
  def create
    @post = current_user.posts.build post_params

    if @post.save
      flash[:success] = "Post created!"
      redirect_back fallback_location: root_path
    else
      flash[:error] = "Could not create."
      redirect_back fallback_location: root_path
    end
  end

  private
  def post_params
    params.require(:post).permit(:body)
  end
end
