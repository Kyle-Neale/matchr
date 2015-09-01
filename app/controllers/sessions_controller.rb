class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    session[:omniauth] = auth
    user = User.sign_in_from_facebook(auth)
    session[:user_id] = user.id
    redirect_to root_url, notice: "signed in"
  end

  def destroy
    session[:user_id] = nil
    session[:omniauth] = nil
    session.delete(:user_id)
    user = nil
    redirect_to root_url, notice: "signed out"


  end
end
