module Api
  module V1
    class AppInfosController < Api::ApplicationController
      
      before_filter :restrict_access
      
      def index
        @app_infos = AppInfo.order("id DESC")
        respond_with(@app_infos)
      end
      
    end
  end
end