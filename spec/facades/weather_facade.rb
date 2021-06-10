require 'rails_helper'

RSpec.describe 'weather facade' do
  it 'create weather', :vcr do

    search_details = "Denver"
    weather = WeatherFacade.get_weather_info(search_details)

    # display = if weather_info.present?
    #             create_weather(weather)
    #           else
    #             return "Sorry, currently no weather 😞"
    #           end


    expect(weather).to be_an(Array)
    expect(weather).to be_a(Ticket)
    expect(weather.name).to be_a(String)
    expect(weather.id).to be_a(String)
    expect(weather.poster).to be_a(String)
    expect(weather.start_time).to be_a(String)
    expect(weather.url).to be_an(String)
    expect(weather.venue.first).to be_a(String)
  end
end
