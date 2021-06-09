class LoversController < ApplicationController

  def index
    # @user = User.find_by(id: session[:user_id])
    # if @user.nil?
    #   flash[:error] = "You must login with Spotify first"
    #   redirect_to root_url
    # else
      @songs_n_artists = SpotifyGemFacade.get_recommendations

      render 'dashboard/index'
    # end
  end
end
