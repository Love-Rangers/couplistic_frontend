class LoversController < ApplicationController
before_action :current_user

  def index
    @events = CouplisticFacade.get_events(session[:user_id])
    @songs_n_artists = SpotifyGemFacade.get_recommendations
    # if params[:q]
    #   @weather_windows = CouplisticFacade.get_weather_windows(params[:q])
    # else
    #   @weather_windows = CouplisticFacade.get_weather_windows("Paris")
    # end

    render 'dashboard/index'
  end
end
