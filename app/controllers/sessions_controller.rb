class SessionsController < ApplicationController
  def new
    #We have received an access_code, which we will now exchange for an access_token and refresh token
    response = Faraday.post(
      'https://accounts.spotify.com/api/token',
      body =
      {
        'grant_type' => "authorization_code",
        'code' => params["code"],
        'redirect_uri' => 'http://localhost:3000/sessions/new'
      },
      headers = { Authorization: "Basic #{Base64.strict_encode64("#{ENV['client_id']}:#{ENV['client_secret']}")}" }
    )
    body = JSON.parse(response.body, symbolize_names: true)
    #We now use our access token to capture user info
    response = Faraday.get('https://api.spotify.com/v1/me', nil, { "Authorization" => "Bearer #{body[:access_token]}" } )
    user_spotify_info = JSON.parse(response.body, symbolize_names: true)
    #set the user and render dashboard/index
    @user = User.where(
      display_name: user_spotify_info[:display_name],
      email: user_spotify_info[:email]
    ).first_or_create

    session[:user_id] = @user.id

    redirect_to lovers_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, alert: 'Logged out'
  end
end
