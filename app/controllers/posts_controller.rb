class PostsController < ApplicationController
	before_filter :authenticate_user!,:except=>[:index]
	def index
		@posts = Post.paginate(page: params[:page])
		@post = Post.new
		@user = User.all
	end

	def destroy
		@post.destroy
		redirect_to root_url
	end

	def create
		@post = current_user.posts.build(params[:post])
		if @post.save
			flash[:success] = "Post created!"
			redirect_to root_url
		else
			render 'index'
		end
	end
end
