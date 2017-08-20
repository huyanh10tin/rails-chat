class PostsController < ApplicationController
  def create
    @post = current_user.posts.build post_params
    @post.save
    @photo = Photo.create!(user_id: current_user.id, attachment_type: "Post", attachment_id: @post.id)
    uploader = PhotoUploader.new
    uploader.store! params[:post][:photo]
    @photo.url = uploader.url
    @photo.save
    if @post.save
      redirect_back fallback_location: root_path
    else
      flash[:error] = "Could not create."
      redirect_back fallback_location: root_path
    end
  end

  def destroy
    @post = Post.find(params[:post][:post_id])
    respond_to do |format|
      format.js
    end
    @post.destroy
  end

  private
  def post_params
    params.require(:post).permit(:body, :wall_id, :photo)
  end
end
