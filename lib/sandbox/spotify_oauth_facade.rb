# class SpotifyOauthFacade
#   def self.exchange_access_code(code)
#     response = Faraday.post(
#       'https://accounts.spotify.com/api/token',
#       body =
#       {
#         'grant_type' => "authorization_code",
#         'code' => code,
#         'redirect_uri' => 'http://localhost:3000/sessions/new'
#       },
#       headers = { Authorization: "Basic #{Base64.strict_encode64("#{ENV['client_id']}:#{ENV['client_secret']}")}" }
#     )
#     body = JSON.parse(response.body, symbolize_names: true)
#     body[:access_token]
#   end
# end
