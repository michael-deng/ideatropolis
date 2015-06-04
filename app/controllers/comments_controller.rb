class CommentsController < ApplicationController

	before_action :authenticate_user!

	def create
		@idea = Idea.find(params[:idea_id])
		@comment = @idea.comments.build(comment_params)
		@comment.user = current_user
		if @comment.save
			Notification.create(
				user_id: @idea.user_id,
				idea_id: @idea.id,
				comment_id: @comment.id,
				read: false
			)
			flash[:success] = "Comment created!"
			redirect_to @idea
		else
			flash[:error] = "There was an error with your comment. Please try again."
			redirect_to @idea
		end
	end

	def edit
		@idea = Idea.find(params[:idea_id])
		@comment = Comment.find(params[:id])
	end

	def update
		@comment = Comment.find(params[:id])
		respond_to do |format|
	    if @comment.update_attributes(comment_params)
	      format.html { redirect_to(@comment, :notice => 'Comment was successfully updated.') }
	      format.json { respond_with_bip(@comment) }
	    else
	      format.html { render :action => "edit" }
	      format.json { respond_with_bip(@comment) }
	    end
	  end
	end
		
	def destroy
		@comment = current_user.comments.find_by(id: params[:id])
		@idea = @comment.idea
		@comment.destroy
		flash[:success] = "Comment deleted!"
		redirect_to @idea
	end

	private

		def comment_params
			params.require(:comment).permit(:content)
		end
end