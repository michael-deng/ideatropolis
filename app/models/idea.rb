class Idea < ActiveRecord::Base
  
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_and_belongs_to_many :categories
  paginates_per 30

  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 2000 }
  validates :category_ids, presence: true
  # validates :difficulty, presence: true

  # DIFFICULTIES = ["Beginner", "Intermediate", "Professional"]
  
  # validates_inclusion_of :difficulty, :in => DIFFICULTIES

  searchable do
    text :title, :content
  end
end
