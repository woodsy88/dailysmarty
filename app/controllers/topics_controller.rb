class TopicsController < ApplicationController
	before_action :set_topic, only: [:show, :edit, :update]

	def index
		@topics = Topic.page(params[:page]).per(15)
	end

	def show
		
	end

	def new
		@topic = Topic.new
	end 

	def create
		@topic = Topic.new(topic_params)
		if @topic.save
			redirect_to topic_posts_path(topic_id: @topic), notice: 'Topic was succesfully created'
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @topic.update(topic_params)
			redirect_to topic_posts_path(topic_id: @topic), notice: 'your topic was succesffuly updated' 
		else
			render :edit, notice: 'Please try again'
		end
	end

	private

	def set_topic
		@topic = Topic.friendly.find(params[:id])
	end

	def topic_params
		params.require(:topic).permit(:title)
	end

end
