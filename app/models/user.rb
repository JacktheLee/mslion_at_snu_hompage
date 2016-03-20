class User < ActiveRecord::Base

  has_many :user_assignments
  has_many :assignments, through: :user_assignments

<<<<<<< HEAD
  belongs_to :team
=======
  has_many :user_teams
  has_many :teams, through: :user_teams
>>>>>>> b801a4f23cae0234c49fc7e14c078aa72679ca26

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_admin
    return self.authority == "admin"
  end
end
