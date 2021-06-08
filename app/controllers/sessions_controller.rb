class SessionsController < ApplicationController
  def create
    # binding.pry
    access_token = request.env["omniauth.auth"]
    user = User.from_omniauth(access_token)
    # user = User.from_omniauth(request.env['omniauth.auth'])

    session[:user_id] = user.id
    redirect_to dashboard_index_path
    end
  #   user = User.from_omniauth(request.env['omniauth.auth'])
  #   # if @user
  #     session[:user_id] = user.id
  #     redirect_to dashboard_index_path
  #   # else
  #     # flash[:error] = "Invalid Credentials"
  #     # redirect_to root_path
  #   # end
  # end

  def destroy
    session.delete :user_id
    flash[:message] = 'You have been logged out.'
    redirect_to root_path
  end

  def invalid
    flash[:error] = "Invalid Credentials"
    redirect_to root_path
  end
end
