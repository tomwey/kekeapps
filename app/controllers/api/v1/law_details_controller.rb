module Api
  module V1
    class LawDetailsController < Api::ApplicationController
      before_filter :restrict_access
      
      def index
        @law_details = LawDetail.latest_laws_by_version(params[:version])
        respond_with(@law_details)
      end
      
    end
  end
end