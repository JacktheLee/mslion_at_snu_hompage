class AssignmentController < ApplicationController

  before_action :authenticate_user!

  def index
  end

  def submit_proc
    target = AssignmentTitle.where(name: params[:title]).take
    assignment = Assignment.create(title: params[:title], comment: params[:comment], git_url: params[:git_url], img: params[:img], assignment_title: target)
    #개인 제출
    UserAssignment.create(user: current_user, assignment: assignment)
    #팀 제출
    #team = Team.find(params[:id]) #혹은 params[:team_number]? 추후에 수정해야 할듯
    #team.users.each do |item|
      #UserAssignment.create(user: item, assignment: assignment)
    #end
    redirect_to "/assignment/index?submit=true"
  end

  def board
    @assignmenttitles = AssignmentTitle.all
    @userassigns=UserAssignment.all
  end

  def get_info
    assignment = AssignmentTitle.where(name: params[:title]).take
    respond_to do |format|
      format.json { render json: {desc: assignment.description}}
    end
  end
end
