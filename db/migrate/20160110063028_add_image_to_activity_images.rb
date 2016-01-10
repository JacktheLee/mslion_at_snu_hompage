class AddImageToActivityImages < ActiveRecord::Migration
  def change
    add_column :activity_images, :image, :string
  end
end
