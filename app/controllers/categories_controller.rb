class CategoriesController < ApplicationController

	def index
		@categories = Category.all
	end

	def show
		@category = Category.find(params[:id])
		@ideas = @category.ideas.page params[:page]
	end
end
