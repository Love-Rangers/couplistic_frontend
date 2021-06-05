class LoversController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id])
    if @user.nil?
      redirect_to root_url, alert: "You must login with Spotify first"
    else

    #theoretical mvp display items  
      # @weather_windows = WeatherFacade.get_weather_windows(@user.id)
      # @recently_played_songs = SpotifySongsFacade.recently_played(@user.id)
      # @events = TicketmasterFacade.get_events(@user.id)
      # @calender = CalenderFacade.populate_calender(@user.id)
      # @next_full_moon = FullMoonService.new(Time.now)

      render 'dashboard/index'
    end
  end
end
