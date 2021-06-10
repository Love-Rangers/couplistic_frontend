class WeatherController < ApplicationController
  def show
    weather = params[:q]
    response = Faraday.get("https://couplistic-be.herokuapp.com/api/v1/weather?q=#{weather}")

    city = params[:q]
    @weather = WeatherFacade.get_weather_info(city)

  end
end
