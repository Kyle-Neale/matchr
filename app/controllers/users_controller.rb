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
  end

  def profile
  end
end
