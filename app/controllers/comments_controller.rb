class CommentsController < ApplicationController

	before_action :authenticate_user!, only: [:create, :destroy]

	def create
		@comment = @idea.comments.build(comment_params)
		@comment.active = current_active
		if @comment.save
			flash[:success] = "Comment created!"
			redirect_to root
		else
			flash[:error] = "There was an error with your comment. Please try again."
			redirect_to root
		end
	end

	def destroy
		@idea = @comment.idea
		@comment.destroy
		redirect_to @idea
	end

	private

		def comment_params
			params.require(:rushee_comment).permit(:content)
		end
end
