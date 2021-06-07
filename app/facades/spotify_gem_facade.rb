class SpotifyGemFacade
  def self.get_recommendations
    RSpotify.authenticate(ENV['client_id'], ENV['client_secret'])
    recommendations = RSpotify::Recommendations.generate(seed_genres: ['romance', 'slow'])
    recommendations.tracks.first(3).map { |i| [i.name, i.artists.map(&:name)] }
  end
end
