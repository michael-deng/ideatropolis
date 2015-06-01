class IdeasController < ApplicationController

	before_action :authenticate_user!, only: [:show, :index]

	def create
		@idea = current_user.ideas.build(idea_params)
		if @idea.save
			flash[:success] = "Comment created!"
			redirect_to @idea
		else
			flash[:error] = "There was an error with your comment. Please try again."
			redirect_to new_idea_path
		end
	end

	def show
		@idea = Idea.find(params[:id])
		@comments = @idea.comments.all
		@comment = @idea.comments.build
	end

	def index
		@ideas = Idea.all
	end

	private

		def idea_params
			params.require(:idea).permit(:title, :content)
		end
end
