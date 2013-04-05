class Cpanel::FeedbacksController < Cpanel::ApplicationController
  def index
    @feedbacks = Feedback.order('created_at DESC').paginate(page: params[:page], per_page: 10)
    fresh_when :etag => [@feedbacks.first, current_user],
               :last_modified => @feedbacks.first.created_at
  end
  
  def show
    @feedback = Feedback.find(params[:id])
    fresh_when :etag => [@feedback, current_user],
               :last_modified => @feedback.created_at
  end
  
  def destroy
    @feedback = Feedback.find(params[:id])
    @feedback.destroy
    redirect_to cpanel_feedbacks_url
  end
end