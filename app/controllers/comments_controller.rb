class CommentsController < ApplicationController
  def create
    @comment = current_suer.comments.build(comment_params)
  end
  private
  def comment_params
    params.require(:comment).permit(:content)
  end

end