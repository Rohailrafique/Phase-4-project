class SessionsController < ApplicationController

  def create
    user = User.find_by(username: params[:username])
    p user
    if user&.authenticate(params[:password])
      session[:user_id] ||= user.id
      cookies[:user_id] ||= user.id
      render json: user, status: :ok
      # response.headers['Access-Control-Allow-Credentials'] = true
      # response.set_header('Access-Control-Allow-Origin', '*')
      # response.set_header('Access-Control-Allow-Credentials', true)
      # render json: { session: session, cookies: cookies }
    else
      render json: { errors: ["Invalid login credentials."] }, status: :unauthorized
    end
  end

  def destroy
    session.delete :user_id
  end

end
