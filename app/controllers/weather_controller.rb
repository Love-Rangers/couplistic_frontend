class WeatherController < ApplicationController
  def show
    @weather = if params[:q].present?
      WeatherFacade.get_weather_info(params[:q])
    else params[:q].empty?
      flash[:notice] = "Sorry, currently no weather 😞"
      redirect_to lovers_path
    end
  end
end
