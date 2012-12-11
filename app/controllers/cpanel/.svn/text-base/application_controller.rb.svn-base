class Cpanel::ApplicationController < ApplicationController
  layout "cpanel"
  before_filter :require_user
  before_filter :require_admin
  
  def require_admin
    if not current_user.admin?
      render_404
    end
  end
end
