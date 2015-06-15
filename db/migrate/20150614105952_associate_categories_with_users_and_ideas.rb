class AssociateCategoriesWithUsersAndIdeas < ActiveRecord::Migration
  def change
  	create_table :users_categories, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :category, index: true
    end

    create_table :ideas_categories, id: false do |t|
      t.belongs_to :idea, index: true
      t.belongs_to :category, index: true
    end
  end
end
