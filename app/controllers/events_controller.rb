class EventsController < ApplicationController
  def create
    conn = Faraday.new(url: 'http://localhost:3001/events')
    response = conn.post('/api/v1/events') do |f|
      f.body = {
        location: params[:location],
        user_id: session[:user_id],
        name: params[:name],
        start_time: params[:start_time]
        #attribute
      }
    end
    body = JSON.parse(response.body, symbolize_names: true)

    flash[:notice] = 'Event Saved' if response.status == 200
    # @events = CouplisticFacade.get_events(@user.id)
    # @next_full_moon = Time.at(FullMoonFacade.next_full_moon).strftime("%A, %b %e")
    # @songs_n_artists = SpotifyGemFacade.get_recommendations
    # render 'dashboard/index'

    redirect_to lovers_url
  end
end
