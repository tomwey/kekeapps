class Cpanel::FeedbacksController < Cpanel::ApplicationController
  def index
    @feedbacks = Feedback.order('created_at DESC')
  end
  
  def show
    @feedback = Feedback.find(params[:id])
  end
  
  def destroy
    @feedback = Feedback.find(params[:id])
    @feedback.destroy
    redirect_to cpanel_feedbacks_url
  end
end