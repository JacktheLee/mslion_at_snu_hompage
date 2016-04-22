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
    request.env['mobvious.device_type']
  end

  def team_lotto
    @this_week = if Team.last then Team.last.week + 1 else 0 end
  end

  def team_lotto_proc
    teams = Snulion.make_team(4)
    week = params[:week].to_i
    Team.where(week: week).map { |item| item.destroy }
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

  def rank_team_proc
    selected_team = Team.find(params[:teamid].to_i)
    selected_team.update(team_score: params[:score].to_i)
    respond_to do |format|
      format.json { render json: {score: selected_team.team_score}}
    end
  end

  def team_info
     week_teams = Team.where(week: params[:week].to_i)
    respond_to do |format|
      format.json { render json: {team: week_teams, num: week_teams.pluck(:team_number)}}
    end
  end

  def team_view
    last_week = Team.last.week
    @teams = Team.where(week: last_week)
  end

  def idea_lotto
  end

  def idea_lotto_proc
    list = Snulion.get_member.sample(15)
    respond_to do |format|
      format.json { render json: {list: list}}
    end
  end

  private

  def is_admin
    unless current_user.is_admin
      redirect_to "/"
    end
  end
end
