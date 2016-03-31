class AssignmentController < ApplicationController

  before_action :authenticate_user!

  def index
  end

  def submit_proc
    target = AssignmentTitle.where(name: params[:title]).take
    assignment = Assignment.create(title: params[:title], comment: params[:comment], git_url: params[:git_url], img: params[:img], assignment_title: target)
    #개인 제출
    UserAssignment.create(user: current_user, assignment: assignment, submition: true)
    #팀 제출
    #team = Team.find(params[:id]) #혹은 params[:team_number]? 추후에 수정해야 할듯
    #team.users.each do |item|
      #UserAssignment.create(user: item, assignment: assignment, submition: true)
    #end
    redirect_to "/assignment/index?submit=true"
  end

  def board
     @test_assigntitle= AssignmentTitle.where(name: "Code Academy").take

  end
  
  def get_info
    assignment = AssignmentTitle.where(name: params[:title]).take
    respond_to do |format|
      format.json { render json: {desc: assignment.description}}
    end
  end
  
  def get_board_info
    title = AssignmentTitle.where(name: params[:title]).take
    imgs=[]
    assigns=title.assignments
    userss = []
    assigns.each do |item|
      userss << item.users.where(user_assignments: {submition: true}).take
      imgs << item.img.to_s
    end
    respond_to do |format|
      format.json { render json: {assign: title.assignments, user: userss, img: imgs}}
    end
  end
end
