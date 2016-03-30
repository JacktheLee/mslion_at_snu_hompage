class Assignment < ActiveRecord::Base
  belongs_to :assignment_title

  has_many :user_assignments
  has_many :users, through: :user_assignments
  mount_uploader :img, AwsUploader
end
