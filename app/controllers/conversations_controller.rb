class ConversationsController < ApplicationController
  before_filter :authenticate_user!
  def new
    @conversation = Conversation.new(from: current_user.id, to: params[:user].id)
    @message = @conversation.message.build
  end

  def create
  end

  def show
  end
end