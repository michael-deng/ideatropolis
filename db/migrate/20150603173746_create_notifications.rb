class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :user, index: true
      t.references :idea, index: true
      t.references :comment, index: true
      t.boolean :read

      t.timestamps null: false
    end
    add_foreign_key :notifications, :users
    add_foreign_key :notifications, :ideas
    add_foreign_key :notifications, :comments
  end
end
