class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea
  belongs_to :comment

  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
	validates :idea_id, presence: true
	validates :comment_id, presence: true
	validates :content, presence: true
end
