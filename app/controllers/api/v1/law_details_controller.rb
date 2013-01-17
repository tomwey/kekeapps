module Api
  module V1
    class LawDetailsController < Api::ApplicationController
      before_filter :restrict_access
      
      def index
        @law_details = LawDetail.latest_laws_by_version(params[:version])
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