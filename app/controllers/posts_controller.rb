class PostsController < ApplicationController

    def index
        if params[:user_id]
            render json: Post.where("user_id = ?", params[:user_id])
        else
            render json: Post.all
        end
    end

    def show
        render json: Post.find(params[:id])
    end

    def create
        if @current_user
            post = @current_user.posts.create!(post_params)
            render json: post, status: :created
        else
            render json: {error: "user not logged in"}
        end
    end

    def update
        if @current_user
            post = @current_user.posts.find(params[:id]).update!(post_params)
            render json: post, status: :ok
        else
            render json: {error: "user not logged in"}
        end
    end

    def destroy
        # TODO: Verify you are logged in as this user first
        user = User.find(params[:id])
        user.destroy
        head :no_content
    end

    private

    def post_params
        params.permit(:title, :content)
    end
end
