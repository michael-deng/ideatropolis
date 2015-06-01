class CommentsController < ApplicationController

	before_action :authenticate_user!, only: [:create, :destroy]

	def create
		@idea = Idea.find(params[:idea_id])
		@comment = @idea.comments.build(comment_params)
		@comment.user = current_user
		if @comment.save
			flash[:success] = "Comment created!"
			redirect_to @comment.idea
		else
			flash[:error] = "There was an error with your comment. Please try again."
			redirect_to @comment.idea
		end
	end

	def destroy
		@idea = @comment.idea
		@comment.destroy
		redirect_to @idea
	end

	private

		def comment_params
			params.require(:comment).permit(:content)
		end
end
