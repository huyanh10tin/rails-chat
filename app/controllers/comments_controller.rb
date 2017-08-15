class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
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
    respond_to do |format|
      format.js
      @comment.destroy
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :body, :post_id)
  end
end
