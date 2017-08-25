class MessagesController < ApplicationController

  def index
    redirect_to inbox_messages_path
  end

  def inbox
    @messages = current_user.received_messages
  end

  def sent
    @messages = current_user.sent_messages
  end

  def new
    @message = Message.new
  end

  def create
    @message = current_user.messages.build message_params

    if @message.save
      redirect_back fallback_location: root_path
    else
      flash[:error] = "Error: #{@message.errors.full_messages.to_sentence}"
      redirect_back fallback_location: root_path
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :conversation_id)
  end
end
