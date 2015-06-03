class CommentsController < ApplicationController

	before_action :authenticate_user!
	before_create :create_notification

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

		def create_notification
			@idea = Idea.find_by(self.idea_id)
			@user = User.find_by(@idea.user_id)
			Notification.create(
				user_id: @user.id,
				idea_id: @idea.id,
				comment_id: self.id,
				read: false
			)
		end
end