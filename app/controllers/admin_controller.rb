class AdminController < ApplicationController

  before_action :authenticate_user!
  before_action :is_admin

  def index
  end

  def set_assignment
  end

  def set_assignment_proc
    AssignmentTitle.create(name: params[:name], description: params[:description])
    redirect_to "/admin/index"
  end

  def team_lotto
<<<<<<< HEAD

=======
    @week = if Team.last then Team.last.week + 1 else 0 end
  end

  def team_lotto_proc
    teams = Snulion.make_team(3)
    week = if Team.last then Team.last.week + 1 else 0 end
    teams.each do |item|
      ##여기부터 곧 만들어야징
    end

    respond_to do |format|
      format.json { render json: {teams: teams}}
    end
>>>>>>> b801a4f23cae0234c49fc7e14c078aa72679ca26
  end

  private

  def is_admin
    unless current_user.is_admin
      redirect_to "/"
    end
  end
end
