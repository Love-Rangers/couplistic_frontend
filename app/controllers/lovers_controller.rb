class LoversController < ApplicationController
before_action :current_user

  def index
    @events = CouplisticFacade.get_events(session[:user_id])
    @songs_n_artists = SpotifyGemFacade.get_recommendations

    render 'dashboard/index'
  end
end
