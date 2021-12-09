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
            post = @current_user.posts.find(params[:id])
            post.update!(post_params)
            render json: post, status: :ok
        else
            render json: {error: "user not logged in"}
        end
    end

    def destroy
        post = Post.find(params[:id])
        if @current_user.id == post.user_id
             post.destroy
            render json: {message: "deleted"}
        else
            render json: {error: "can't delete other user's post"}, status: :unauthorized
        end
    end

    private

    def post_params
        params.permit(:title, :content)
    end
end
