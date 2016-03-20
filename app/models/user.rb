class User < ActiveRecord::Base

  has_many :user_assignments
  has_many :assignments, through: :user_assignments

  belongs_to :team

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_admin
    return self.authority == "admin"
  end
end
