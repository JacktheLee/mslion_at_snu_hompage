class Team < ActiveRecord::Base
<<<<<<< HEAD
<<<<<<< HEAD
  has_many :users
=======
  has_many :user_teams
  has_many :users, through: :user_teams
>>>>>>> b801a4f23cae0234c49fc7e14c078aa72679ca26
=======
  has_many :user_teams
  has_many :users, through: :user_teams
>>>>>>> 7c5ba6f07bf7f0ad88781741faf3ef103865e547
end
