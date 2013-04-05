class Cpanel::HomeController < Cpanel::ApplicationController
  def index
    @recent_app_infos = AppInfo.recent.limit(10)
    @recent_feedbacks = Feedback.recent.limit(10)
    
    app_info = @recent_app_infos.first
    feedback = @recent_feedbacks.first
    
    fresh_when :etag => app_info.hash + feedback.hash
    
  end
  
end
