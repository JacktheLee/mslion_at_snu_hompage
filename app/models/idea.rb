class Idea < ActiveRecord::Base
  mount_uploader :draft, AwsUploader
  belongs_to :user
end
