class IdeasController < ApplicationController

	before_action :authenticate_user!, except: [:index]

	def new
		@idea = Idea.new
	end

	def create
		@idea = current_user.ideas.build(idea_params)
		if @idea.save
			flash[:success] = "Idea created!"
			redirect_to @idea
		else
			flash.now[:error] = "There was an error with your idea. Please try again."
			render 'new'
		end
	end

	def edit
		@idea = Idea.find(params[:id])
	end

	def update
		@idea = Idea.find(params[:id])
		if @idea.update_attributes(idea_params)
      flash[:success] = "Idea updated!"
      redirect_to @idea
    else
    	flash.now[:error] = "There was an error with your update. Please try again."
      render 'edit'
    end
  end

  def destroy
  	@idea = current_user.ideas.find_by(id: params[:id])
  	redirect_to root_path if @idea.nil?
  	@idea.destroy
  	flash[:success] = "Idea deleted!"
  	redirect_to ideas_path
  end

	def show
		if params.has_key?(:notification_id)
			@notification = Notification.find(params[:notification_id])
	  	@notification.update_attribute(:read, true)
	  end
		@idea = Idea.find(params[:id])
		@comments = @idea.comments.all
		@comment = @idea.comments.build
	end

	def index
		if params[:search].blank?
			@ideas = Idea.all
		else
			@search = Idea.solr_search do
				fulltext params[:search]
			end
			@ideas = @search.results
		end
	end

	private

		def idea_params
			params.require(:idea).permit(:title, :content, :difficulty, :category_ids => [])
		end
end
