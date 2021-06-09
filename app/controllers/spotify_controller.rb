class SpotifyController < ApplicationController
  def new
    scope = 'user-read-recently-played user-read-email'
    redirect_uri = 'https://couplistic-fe.herokuapp.com//sessions/new' # needs to be heroku address
    #First step of OAuth => to authorization server with Client id and redirect_uri
    redirect_to 'https://accounts.spotify.com/authorize' +
    "?response_type=code" + "&client_id=#{ENV['client_id']}" +
    "&scope=#{scope}" + "&redirect_uri=#{redirect_uri}"
    #Will redirect_to a new session (localhost:3000//sessions/new)
  end
end
