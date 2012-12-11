class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def render_404
    render_optional_error_file(404)
  end
  
  def render_optional_error_file(status_code)
    status = status_code.to_s
    if ["404", "403", "422", "500"].include?(status)
      render :template => "/errors/#{status}.html.erb", :status => status, :layout => "application"
    else
      render :template => "/errors/unknown.html.erb", :status => status, :layout => "application"
    end
  end
  
  def require_user
    if current_user.blank?
      respond_to do |format|
        format.html {
          authenticate_user!
        }
        format.all {
          head :unauthorized
        }
      end
    end
  end
end
