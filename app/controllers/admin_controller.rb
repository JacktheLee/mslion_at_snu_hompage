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

  private

  def is_admin
    unless current_user.is_admin
      redirect_to "/"
    end
  end
end
