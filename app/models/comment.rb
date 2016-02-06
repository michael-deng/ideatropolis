class Comment < ActiveRecord::Base

	belongs_to :user
	belongs_to :idea
	has_many :notifications, dependent: :destroy

	validates :user_id, presence: true
	validates :idea_id, presence: true
	validates :content, presence: true, length: { maximum: 1000 }
end
