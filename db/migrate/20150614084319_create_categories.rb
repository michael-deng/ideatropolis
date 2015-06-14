class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end

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
