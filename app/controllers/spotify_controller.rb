class SpotifyController < ApplicationController
  def new
    response_type = 'code'
    client_id = '99cab5135f2444c69a8ca09f1ec4e68d'
    scope = 'user-read-recently-played user-read-email'
    redirect_uri = 'http://localhost:3000/sessions/new'

    #First step of OAuth => to authorization server with Client id and redirect_uri
    redirect_to 'https://accounts.spotify.com/authorize' +
    "?response_type=#{response_type}" + "&client_id=#{client_id}" +
    "&scope=#{scope}" + "&redirect_uri=#{redirect_uri}"
    #Will redirect_to a new session (localhost:3000//sessions/new)
  end
end
