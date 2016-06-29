class PostsController < ApplicationController
	before_action :set_post, only: [:edit, :update, :show, :delete, :destroy, :like, :unlike]
	before_action :authenticate_user!
	before_action :owned_post, only: [:edit, :update, :destroy]

	def index
		@posts = Post.all.order('created_at DESC').page params[:page]
	end

	def show
	end

	def new
		@post = current_user.posts.build
	end

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
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

	def like
		if @post.liked_by current_user
			respond_to do |format|
				format.html { redirect_to :back }
				format.js
			end
		end
	end

	def unlike
		if @post.unliked_by current_user
			respond_to do |format|
				format.html { redirect_to :back }
				format.js
			end
		end
	end

private
	def post_params
		params.require(:post).permit(:caption, :image)		
	end

	def set_post
		@post = Post.find(params[:id])
	end

	def owned_post
		unless current_user == @post.user
			flash[:alert] = "That post doesn't belong to you!"
			redirect_to root_path
		end
	end
end
