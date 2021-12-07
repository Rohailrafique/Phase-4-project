class FollowersController < ApplicationController

    def create
        if @current_user.id = params[:follower_id] 
            follower = Follower.create!(follower_params)
            render json: follower, status: :created
        else 
            render json: {error: "User not logged in"}
        end
    end

    def destroy
        if @current_user.id = params[:follower_id] 
            Follower.find(params[:id]).destroy
            head :no_content
        else
            render json: {error: "User not logged in"}
        end

    private

    def follower_params
        params.permit(:follower_id, :followed_id)
    end
end
