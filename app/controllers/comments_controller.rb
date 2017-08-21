class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.create!(comment_params)
    @parent = params[:comment][:parent_id]

    if params[:comment][:photo]
      @photo = Photo.create!(user_id: current_user.id, attachment_type: "Comment", attachment_id: @comment.id)
      uploader = PhotoUploader.new
      uploader.store! params[:comment][:photo]
      @photo.url = uploader.url
      @photo.save
    end

    respond_to do |format|
      if @comment.save
        format.html {redirect_back(fallback_location: root_path)}
        format.js
      else
        flash[:warning] = 'Could not create comment. Please try again.'
        format.html {redirect_back(fallback_location: root_path)}
        format.js
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @parent = @comment.parent
    respond_to do |format|
      format.js
      @comment.destroy
      @parent.save
      @parent = @parent.id
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :body, :post_id, :parent_id, :photo)
  end
end
