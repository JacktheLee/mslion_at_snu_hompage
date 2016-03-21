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
  end

  def team_lotto_proc
    teams = Snulion.make_team(3)
    week = if Team.last then Team.last.week + 1 else 0 end
    teams.each_with_index do |item, i|
      team = Team.create(team_number: i, week: week)
      item.each do |name|
        team.users << User.where(name: name).take
      end
    end
    respond_to do |format|
      format.json { render json: {teams: teams}}
    end
  end
  
  def rank_team
  end

  private

  def is_admin
    unless current_user.is_admin
      redirect_to "/"
    end
  end
end
