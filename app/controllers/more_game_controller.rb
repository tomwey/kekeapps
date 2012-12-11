class MoreGameController < ApplicationController
  layout 'device'
  def more
    @app_infos = AppInfo.all
  end
end
