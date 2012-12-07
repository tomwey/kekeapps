class Cpanel::ApplicationController < ApplicationController
  layout "cpanel"
  before_filter :require_user
  before_filter :require_admin
  
  def require_admin
    if "kekestudio@163.com" != current_user.email
      render_404
    end
  end
end
