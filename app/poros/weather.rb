class Weather
  attr_reader :sunrise_time,
              :sunset_time,
              :moonphase,
              :moon_rise_time,
              :moon_set_time,
              :forecast_condition,
              :forecast_icon,
              :moon_illumination_grade,
              :id,
              :next_full_moon

  def initialize(weather_data)
    @id                       = nil
    @next_full_moon           = weather_data[:data][:attributes][:next_full_moon]
    @sunrise_time             = weather_data[:data][:attributes][:sunrise_time]
    @sunset_time              = weather_data[:data][:attributes][:sunset_time]
    @moonphase                = weather_data[:data][:attributes][:moonphase]
    @moon_rise_time           = weather_data[:data][:attributes][:moon_rise_time]
    @moon_set_time            = weather_data[:data][:attributes][:moon_set_time]
    @forecast_condition       = forecast_condition_attr(weather_data)
    @forecast_icon            = forecast_icon_attr(weather_data)
    @moon_illumination_grade  = moon_illumination_grade_attr(weather_data)
  end

  def forecast_condition_attr(weather_data)
    weather_data[:data][:attributes][:forecast_condition].map do |d|
      d
    end
  end

  def forecast_icon_attr(weather_data)
    weather_data[:data][:attributes][:forecast_icon].map do |d|
      d
    end
  end

  def moon_illumination_grade_attr(weather_data)
    weather_data[:data][:attributes][:moon_illumination_grade].map do |d|
      d
    end
  end
end
