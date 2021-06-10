class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    access_token = SpotifyOauthFacade.exchange_access_code(params["code"])
    spotify_user = SpotifyUserFacade.request_name_and_password(access_token)
    session[:user_id] = spotify_user.id
    redirect_to lovers_url
  end

  def destroy
    session[:user_id] = nil
    flash[:message] = "Logged out"
    redirect_to root_url
  end
end
