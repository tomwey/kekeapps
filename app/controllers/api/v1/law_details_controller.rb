module Api
  module V1
    class LawDetailsController < Api::ApplicationController
      before_filter :restrict_access
      
      def index
        bundle_id = params[:bundle_id] || "com.kekestudio.LawBooksChina"
        
        app_info = AppInfo.find_by_bundle_id(bundle_id)
        unless app_info
          respond_with({ :error => 'Not Found' }, :status => 404)
          return
        end
        
        @law_details = app_info.law_details.latest_laws_by_version(params[:version])
        if @law_details.empty?
          respond_with(@law_details)
          return
        end
        version = @law_details[0].version
        render json: { :latest_version => version, 
                       :result => @law_details
                     }
      end
      
    end
  end
end