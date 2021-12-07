class UsersController < ApplicationController

    def index
        render json: User.all
    end

    def show
        render json: User.find(params[:id])
    end

    def create
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
    end

    def update

    end

    def destroy
        # TODO: Verify you are logged in as this user first
        user = User.find(params[:id])
        user.destroy
        head :no_content
    end

    private

    def user_params
        params.permit(:email, :username, :password, :password_confirmation, :display_name, :image_url, :twitter_url, :facebook_url, :linkedin_url)
    end

end
