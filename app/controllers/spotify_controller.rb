class SpotifyController < ApplicationController
  def new
    scope = 'user-read-email'
    redirect_uri = 'http://localhost:3000/sessions/new'

    redirect_to 'https://accounts.spotify.com/authorize' +
    "?response_type=code" + "&client_id=#{ENV['client_id']}" +
    "&scope=#{scope}" + "&redirect_uri=#{redirect_uri}"
  end
end
