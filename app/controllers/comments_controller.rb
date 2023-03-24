class CommentsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @project.comments.create(comment_params.merge(user: current_user))
    redirect_to @project
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
