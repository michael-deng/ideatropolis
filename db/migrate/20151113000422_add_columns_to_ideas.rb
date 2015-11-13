class AddColumnsToIdeas < ActiveRecord::Migration
  def change
  	add_column :ideas, :summary, :text
  	add_column :ideas, :problem, :text
  end
end
