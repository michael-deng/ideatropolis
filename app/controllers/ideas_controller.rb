class IdeasController < ApplicationController

	def show
		@idea = Idea.find(params[:id])
	end

	def index
		@ideas = Idea.all
	end
end
