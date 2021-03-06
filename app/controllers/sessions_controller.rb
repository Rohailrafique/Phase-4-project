class SessionsController < ApplicationController

  def create
    user = User.find_by(username: params[:username])
    p user
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      # cookies[:user_id] ||= user.id
      # response.headers['Access-Control-Allow-Credentials'] = true
      # response.set_header('Access-Control-Allow-Credentials', true)
      render json: user, status: :ok
      # response.set_header('Access-Control-Allow-Origin', '*')
      # render json: { session: session, cookies: cookies }
    else
      render json: { errors: ["Invalid login credentials."] }, status: :unauthorized
    end
  end

  def destroy
    session.delete :user_id
    head :no_content
  end

end
