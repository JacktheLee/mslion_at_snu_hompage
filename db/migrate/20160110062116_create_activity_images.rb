class CreateActivityImages < ActiveRecord::Migration
  def change
    create_table :activity_images do |t|

      t.timestamps null: false
    end
  end
end
