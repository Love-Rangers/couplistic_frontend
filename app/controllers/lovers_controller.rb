class LoversController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id])
    if @user.nil?
      redirect_to root_url, alert: "You must login with Spotify first"
    else
      render 'dashboard/index'
    end
  end
end
