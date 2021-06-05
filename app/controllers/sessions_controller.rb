class SessionsController < ApplicationController
  def new
    #We have received an access_code, which we will now exchange for an access_token and refresh token
    access_token = SpotifyOauthFacade.exchange_access_code(params["code"])
    #We now use our access token to capture user info
    spotify_user = SpotifyUserFacade.request_name_and_password(access_token)
    #authorize with user in session cookie
    session[:user_id] = spotify_user.id
    redirect_to lovers_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, alert: 'Logged out'
  end
end
