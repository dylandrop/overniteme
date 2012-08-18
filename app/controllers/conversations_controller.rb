class ConversationsController < ApplicationController
  before_filter :authenticate_user!
  def new
    @conversation = Conversation.new(from: current_user, to: User.find(params[:user]))
    @message = @conversation.messages.build
  end

  def create
  end

  def show
  end
end