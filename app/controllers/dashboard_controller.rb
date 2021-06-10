class DashboardController < ApplicationController
  def index
    @songs_n_artists = SpotifyGemFacade.get_recommendations
  end
end
    # @user = User.find_by(id: session[:user_id])
    # if @user.nil?
    #   flash[:error] = "You must login with Spotify first"
    #   redirect_to root_url
    # else

      # render 'dashboard/index'
    # end
