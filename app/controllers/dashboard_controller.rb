class DashboardController < ApplicationController
  def index
    @songs_n_artists = SpotifyGemFacade.get_recommendations
  end
end
