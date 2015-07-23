class Category < ActiveRecord::Base

	has_and_belongs_to_many :ideas
	has_and_belongs_to_many :users

	default_scope -> { order(name: :asc) }

	validates :name, presence: true
end
