class MessagesController < ApplicationController
  before_filter :authenticate_user!
  def create
    @message = Message.new(params[:message])
    @message.conversation = Conversation.find(params[:conversation_id])
    @message.save
    redirect_to @message.conversation
  end
end