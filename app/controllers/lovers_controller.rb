class LoversController < ApplicationController

  def index
    @user = User.find_by(id: session[:user_id])
    if @user.nil?
      redirect_to root_url, alert: "You must login with Spotify first"
    else

    #theoretical mvp display items
      # @weather_windows = CouplisticFacade.get_weather_windows(@user.id)
      # @recently_played_songs = SpotifySongsFacade.recently_played(@user.id)
      # @events = CouplisticFacade.get_events(@user.id)
      # @calender = CalenderFacade.populate_calender(@user.id)
      @next_full_moon = Time.at(FullMoonFacade.next_full_moon).strftime("%A, %b %e")

      render 'dashboard/index'
    end
  end
end
