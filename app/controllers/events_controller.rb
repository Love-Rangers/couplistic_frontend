class EventsController < ApplicationController
  def create
    conn = Faraday.new(url: "https://couplistic-be.herokuapp.com/")

    response = conn.post('/api/v1/events') do |f|
      f.body = {
        location: params[:location],
        user_id: session[:user_id],
        name: params[:name],
        start_time: params[:start_time]
      }
    end
    body = JSON.parse(response.body, symbolize_names: true)

    flash[:notice] = 'Event Saved' if response.status == 200

    redirect_to lovers_url
  end
end
