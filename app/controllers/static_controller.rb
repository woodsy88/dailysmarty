class StaticController < ApplicationController

	def home
		@posts = Post.all.limit(25)
		@topics = Topic.all
	end
end