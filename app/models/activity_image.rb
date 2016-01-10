class ActivityImage < ActiveRecord::Base
  mount_uploader :image, ImageUploader
end
