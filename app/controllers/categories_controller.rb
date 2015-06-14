class CategoriesController < ApplicationController

	def create
		@category = Category.new(category_path)
		@category.save
	end

	private

		def category_params
			params.require(:category).permit(:name, :description)
		end
end
