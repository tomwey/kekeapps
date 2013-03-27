module Api
  module V1
    class LawDetailsController < Api::ApplicationController
      before_filter :restrict_access
      before_filter :load_law_details
      
      def index
        
        if @law_details.empty?
          respond_with(@law_details)
          return
        end
        version = @law_details[0].version
        render json: { :latest_version => version, 
                       :result => @law_details
                     }
      end
      
      def check_data
        count = @law_details.length
        version = 0
        if count == 0
          render :json => { :count => 0 }
        else
          version = @law_details[0].version
          render :json => { :count => count, :latest_version => version }
        end
      end
      
      
      private
      def load_law_details
        bundle_id = params[:bundle_id] || "com.kekestudio.LawBooksChina"
        @law_details = LawDetail.joins(:app_info)
                 .where('app_infos.bundle_id = ?', bundle_id)
                 .latest_laws_by_version(params[:version])
      end
      
    end
  end
end