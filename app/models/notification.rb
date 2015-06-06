class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea
  belongs_to :comment
  default_scope -> { order(created_at: :desc) }
end
