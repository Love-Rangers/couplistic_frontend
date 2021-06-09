class Weather
  attr_reader :sunrise,
              :sunset,
              :moonphase,
              :moonrise,
              :moonset,
              :next_full_moon,
              :next_3_days_forecast,
              :next_3_days_icons
  def initialize(weather_data)
    @next_full_moon           = next_full_moon_date(weather_data[:next_full_moon])
    @sunrise                  = weather_data[:sunrise_time]
    @sunset                   = weather_data[:sunset_time]
    @moonphase                = weather_data[:moonphase]
    @moonrise                 = weather_data[:moon_rise_time]
    @moonset                  = weather_data[:moon_set_time]
    @next_3_days_forecast     = weather_data[:forecast_condition]
    @next_3_days_icons        = weather_data[:forecast_icon]
  end

  def next_full_moon_date(epoch_time)
    Time.at(epoch_time)
    .strftime("%m/%d/%Y at %I:%M%p")
  end

  def two_days_from_today
    1.days.from_now.strftime("%A")
  end

  def three_days_from_today
    2.days.from_now.strftime("%A")
  end
end
