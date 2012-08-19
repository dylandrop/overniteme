class ConversationsController < ApplicationController
  before_filter :authenticate_user!
  def new
    @conversation = Conversation.new(from: current_user, to: User.find(params[:user]))
    @conversation.messages.build
  end

  def create
    @conversation = Conversation.create(params[:conversation])
    redirect_to @conversation
  end

  def show
    @conversation = Conversation.find(params[:id], include: [:messages])
  end
end