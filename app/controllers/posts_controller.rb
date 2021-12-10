class PostsController < ApplicationController

    def index
        if params[:user_id]
            render json: Post.order(created_at: :desc).where("user_id = ?", params[:user_id]), each_serializer: PostDetailSerializer
        else
            render json: Post.order(created_at: :desc), each_serializer: PostDetailSerializer
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
            render json: {errors: ["You are not logged in"]}, status: :unauthorized
        end
    end

    def update
        if @current_user
            post = @current_user.posts.find(params[:id])
            post.update!(post_params)
            render json: post, status: :ok
        else
            render json: {errors: ["You are not logged in"]}, status: :unauthorized
        end
    end

    def destroy
        post = Post.find(params[:id])
        if @current_user.id == post.user_id
             post.destroy
            render json: {message: "deleted"}
        else
            render json: {errors: ["Can't delete other user's post"]}, status: :unauthorized
        end
    end

    private

    def post_params
        params.permit(:title, :content)
    end
end
