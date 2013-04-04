class HomeController < ApplicationController
	def home
		@posts = Post.paginate(page: params[:page])
	end

	def galary
	end

	def about
	end

	def contact
	end
end
