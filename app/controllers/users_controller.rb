class UsersController < ApplicationController

  before_action :require_login
  def index
    if params[:id]
      @users = User.where("id < ?",params[:id])
    else
      @users = User.all
    end
    respond_to  do |format|
      format.html
      format.js
    end
  end

  def edit
  end

  def matches
    @matches = current_user.friendships.where(state: "ACTIVE").map(&:friend) + current_user.inverse_friendships.where(state: "ACTIVE").map(&:user)
  end

  def profile
  end
end
