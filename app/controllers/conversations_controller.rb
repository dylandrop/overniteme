class ConversationsController < ApplicationController
  before_filter :authenticate_user!
  def new
    @conversation = Conversation.new(from_id: current_user.id, to_id: params[:user].id)
  end

  def create
  end

  def show
  end
end