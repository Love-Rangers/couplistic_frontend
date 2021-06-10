class WeatherController < ApplicationController
  def show
    city = params[:q]
    @weather = WeatherFacade.get_weather_info(city)
  end
end
