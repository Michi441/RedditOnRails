class CommentsController < ApplicationController

  before_action :find_commentable

  def new
    @comment = current_user.build(params.require(:comment).permit(:comment))
  end

  def create
    @comment = @commentable.comments.new(params.require(:comment).permit(:comment).merge(user_id: current_user.id))

    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      render :new
    end

  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy

    redirect_back(fallback_location: root_path)
  end

  private

  ## check if comment is for a comment or for a reddit thread.
  def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Submission.find_by_id(params[:submission_id]) if params[:submission_id]
    end

end
