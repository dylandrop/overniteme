class UsersController < ApplicationController
  before_filter :authenticate_user!
  def index
    @users = current_user.matches(params[:group] || false).paginate(:page => params[:page], :per_page => 10)
  end
end