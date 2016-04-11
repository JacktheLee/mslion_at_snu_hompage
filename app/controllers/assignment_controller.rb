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
    if(params[:title]==nil || params[:title]=="")
     @test_assigntitle= AssignmentTitle.last
    else
     @test_assigntitle= AssignmentTitle.where(name: params[:title]).take
    end
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
    users = []
    like=[]
    like_sum=[]
    assigns.each do |item|
      if item.user_assignments.where(user_id: current_user.id).take==nil
        like << false
      else
        like << item.user_assignments.where(user_id: current_user.id).take.likbtn
      end
      users << item.users.where(user_assignments: {submition: true}).take
      imgs << item.img.to_s
      like_sum << liksum(item)
    end
    respond_to do |format|
      format.json { render json: {assign: assigns, user: users, img: imgs,user_id: current_user.id, likes: like, sum: like_sum}}
    end
  end
  
  def assign_delete
      @id=params[:value].to_i
      Assignment.find(@id).destroy
      @title=params[:title].to_s
      redirect_to "/assignment/board?title=#{params[:title]}"
  end
  
  def like_btn
    @like=0
    id=params[:assign_id].to_i
    assign=Assignment.find(id)
    if assign.user_assignments.where(user_id: current_user.id).take==nil
    UserAssignment.create(user: current_user, assignment: assign, submition: false, likbtn: params[:like])
    end
    
    user_assignment=assign.user_assignments.where(user_id: current_user.id).take
    user_assignment.update(likbtn: params[:like])
   
    
    respond_to do |format|
      format.json{render json:{user_assign: user_assignment, like_sum: liksum(assign)}}
    end
  end
  private
  def liksum(assign)
    like=0
    assign.user_assignments.each do |user_assign|
                  if assign.user_assignments.where(user_id: user_assign.user_id).take.likbtn
                    like+=1 
                  end
    end
    return like
  end
  
end
