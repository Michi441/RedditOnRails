class SubmissionsController < ApplicationController

  before_action :authenticate_user!
  def index
    @submissions = Submission.order(created_at: :desc)


  end

  def show

    @submission = Submission.find(params[:id])

  end

  def new
    @submission = Submission.new
  end

  def create

    @submission = current_user.submissions.build(params.require(:submission).permit(:title, :content))

    if @submission.save
      redirect_to root_path
    else
      render :new
    end


  end
end
