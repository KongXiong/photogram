class PostsController < ApplicationController
	before_action :find_post, only: [:edit, :update, :show, :delete, :destroy]
	before_action :authenticate_user!

	def index
		@posts = Post.all
	end

	def show
	end

	def new
		@post = Post.new
	end

	def create
		if @post = Post.create(post_params)
			flash[:success] = "Created new Post"
			redirect_to posts_path
		else
            flash.now[:alert] = "Your new post couldn't be created!  Please check the form."
			render :new
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			flash[:success] = "Updated"
			redirect_to post_path
		else
			render :edit
		end
	end

	def delete
	end

	def destroy
		@post.destroy
		flash[:success] = "Deleted"
		redirect_to root_path
	end

private
	def post_params
		params.require(:post).permit(:caption, :image)		
	end

	def find_post
		@post = Post.find(params[:id])
	end
end
