class Cpanel::FeedbacksController < Cpanel::ApplicationController
  def index
    @feedbacks = Feedback.order('created_at DESC')
  end
  
  def show
    @feedback = Feedback.find(params[:id])
  end
end