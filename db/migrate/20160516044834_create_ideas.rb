class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title
      t.string  :draft
      t.string :url
      t.text :description
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
