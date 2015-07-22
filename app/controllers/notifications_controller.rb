class NotificationsController < ApplicationController

  before_action :authenticate_user!

  def index
  	@notifications = current_user.notifications
  	#@notifications.each do |notification|
  	#	notification.update_attribute(:read, true)
  	#end
  end

  def read
  	@notification = Notification.find(params[:id])
  	@notification.update_attribute(:read, true)
  end
end
