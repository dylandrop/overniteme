class ConversationsController < ApplicationController
  before_filter :authenticate_user!
  def new
    recipient = User.find(params[:user])
    @conversation = Conversation.new(to: recipient)
    @conversation.messages.build
  end

  def create
    @conversation = Conversation.new(params[:conversation])
    @conversation.to = User.find(params[:to_id])
    @conversation.from = current_user
    @conversation.messages.first.from = current_user
    @conversation.save
    redirect_to @conversation
  end

  def show
    @conversation = Conversation.find(params[:id], include: [:messages])
  end

  def index
    @conversations = current_user.conversations.try(:order, "created_at DESC")
  end
end