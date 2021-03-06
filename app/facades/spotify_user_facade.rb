class SpotifyUserFacade
  def self.request_name_and_password(access_token)
    response = Faraday.get('https://api.spotify.com/v1/me') do |f|
      f.headers["Authorization"] = "Bearer #{access_token}"
    end

    user_spotify_info = JSON.parse(response.body, symbolize_names: true)
    
    @user = User.where(
      display_name: user_spotify_info[:display_name],
      email: user_spotify_info[:email]
    ).first_or_create
  end
end
