class IdeasController < ApplicationController

	before_action :authenticate_user!, only: [:show, :index]

	def show
		@idea = Idea.find(params[:id])
		@comments = @idea.comments
		@comment = @idea.comments.build(user_id: @idea.user_id) if user_signed_in?
	end

	def index
		@ideas = Idea.all
	end
end
