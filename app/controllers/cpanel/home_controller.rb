class Cpanel::HomeController < Cpanel::ApplicationController
  def index
    @recent_app_infos = AppInfo.recent.limit(20)
    @recent_newsblasts = Newsblast.recent.limit(20)
  end
end
