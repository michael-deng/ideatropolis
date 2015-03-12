class AddIndexToIdeas < ActiveRecord::Migration
  def change
  	add_index :ideas, [:user_id, :created_at]
  end
end
