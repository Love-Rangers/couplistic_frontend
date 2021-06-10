class LoversController < ApplicationController

  def index
    @user = User.find_by(id: session[:user_id])
    if @user.nil?
      redirect_to root_url, alert: "You must login with Spotify first"
    else
    #theoretical mvp display items
      # @weather_windows = CouplisticFacade.get_weather_windows(@user.id)
      @events = CouplisticFacade.get_events(session[:user_id])
      # @next_full_moon = Time.at(CouplisticFacade.get_weather_windows).strftime("%A, %b %e")
      @songs_n_artists = SpotifyGemFacade.get_recommendations

      render 'dashboard/index'
    end
  end
end
