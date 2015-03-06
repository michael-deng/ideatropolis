class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.text :title
      t.text :content
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :ideas, :users
  end
end
