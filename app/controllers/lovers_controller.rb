class LoversController < ApplicationController

  def index
    @user = User.find_by(id: session[:user_id])
    if @user.nil?
      redirect_to root_url, alert: "You must login with Spotify first"
    else
      @events = CouplisticFacade.get_events(session[:user_id])
      @songs_n_artists = SpotifyGemFacade.get_recommendations
      if params[:q]
        @weather_windows = CouplisticFacade.get_weather_windows(params[:q])
      else
        @weather_windows = CouplisticFacade.get_weather_windows("Paris")
      end
      render 'dashboard/index'
    end
  end
end
