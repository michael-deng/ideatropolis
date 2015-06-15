class RenameOldTableToNewTable < ActiveRecord::Migration
  def change
  	rename_table :ideas_categories, :categories_ideas
  	rename_table :users_categories, :categories_users
  end
end
