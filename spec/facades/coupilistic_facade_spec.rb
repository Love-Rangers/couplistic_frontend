require 'rails_helper'

RSpec.describe 'couplistic facade' do
  it 'can get events' do

      find_events = CouplisticFacade.get_events(user_id)

      expect(find_events).to be_an(Array)
      expect(find_events).to be_a(Ticket)
      expect(find_events.name).to be_a(String)
      expect(find_events.id).to be_a(String)
      expect(find_events.poster).to be_a(String)
      expect(find_events.start_time).to be_a(String)
      expect(find_events.url).to be_an(String)
      expect(find_events.venue.first).to be_a(String)
  end

  it 'can return a weather object' do
    weather = CouplisticFacade.get_weather_windows(city)

    expect(weather).to be_a(Weather)
    expect(weather.sunrise_time).to be_a(String)
    expect(weather.sunset_time).to be_a(String)
    expect(weather.moonphase).to be_a(String)
    expect(weather.moon_rise_time).to be_a(String)
    expect(weather.moon_set_time).to be_a(String)
    expect(weather.forecast_condition).to be_an(Array)
    expect(weather.forecast_condition.first).to be_a(String)
    expect(weather.forecast_icon).to be_an(Array)
    expect(weather.forecast_icon.first).to be_a(String)
    expect(weather.moon_illumination_grade).to be_an(Array)
    expect(weather.moon_illumination_grade.first).to be_a(String)
  end
end
