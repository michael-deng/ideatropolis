class StaticPagesController < ApplicationController

	before_action :disable_nav, only: [:landing]

	def landing
	end

	private

		def disable_nav
			@disable_nav = true
		end
end
