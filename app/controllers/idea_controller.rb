class IdeaController < ApplicationController
  def idea
  end
  def description
  end
  def upload_proc
    Idea.create(user: current_user,title: params[:idea_title], draft: params[:file], url: params[:git_url], description: params[:comment])
    redirect_to '/idea/idea'
  end
end
