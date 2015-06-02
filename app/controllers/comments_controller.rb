class CommentsController < ApplicationController

	before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]

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

	def edit
		@idea = Idea.find(params[:idea_id])
		@comment = Comment.find(params[:id])
	end

	def update
		@comment = Comment.find(params[:id])
		if @comment.update_attributes(comment_params)
      flash[:success] = "Comment updated"
      redirect_to @comment.idea
    else
      render 'edit'
    end
  end

	def destroy
		@comment = current_user.comments.find_by(id: params[:id])
		@idea = @comment.idea
		@comment.destroy
		flash[:success] = "Comment deleted"
		redirect_to @idea
	end

	private

		def comment_params
			params.require(:comment).permit(:content)
		end
end