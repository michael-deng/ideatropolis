class AddDifficultyToIdeas < ActiveRecord::Migration
  def change
  	add_column :ideas, :difficulty, :string
  end
end
