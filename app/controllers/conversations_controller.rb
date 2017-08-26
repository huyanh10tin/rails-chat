class ConversationsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    if params[:page]
      @conversations = current_user.conversations.page(params[:page])
      respond_to do |format|
        format.html
        format.js
      end
    else
      @conversations = current_user.conversations.page(params[:page])
      respond_to do |format|
        format.html
        format.js
      end
    end
  end
end
