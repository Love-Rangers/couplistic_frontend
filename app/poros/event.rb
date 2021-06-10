class Event
  attr_reader :location, :name, :start_time
  
  def initialize(data)
    @location = data[:attributes][:location]
    @name = data[:attributes][:name]
    @start_time = data[:attributes][:start_time]
    @user_id = data[:attributes][:user_id]
  end
end
