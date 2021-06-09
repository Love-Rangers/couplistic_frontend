class WeatherController < ApplicationController
  def show
    weather = params[:q]
    response = Faraday.get("https://couplistic-be.herokuapp.com/api/v1/weather?q=#{weather}")
  end
end
