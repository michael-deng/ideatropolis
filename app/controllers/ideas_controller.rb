class IdeasController < ApplicationController

	def show
		@idea = Idea.find(params[:id])
		@comments = @idea.comments
		@comment = @idea.comments.build(user_id: @idea.user_id) if user_signed_in?
	end

	def index
		@ideas = Idea.all
	end
end
