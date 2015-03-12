class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
    	t.belongs_to :user, index:true
      t.text :title
      t.text :content

      t.timestamps null: false
    end
  end
end
