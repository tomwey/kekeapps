module Api
  module V1
    class NewsBlastsController < ApplicationController
      before_filter :restrict_access
      respond_to :json
      
      def index
        @news_blasts = NewsBlast.recent
        respond_with(@news_blasts)
      end
      
      private 
      
      def restrict_access
        api_key = ApiKey.find_by_access_token(params[:access_token])
        head :unauthorized unless api_key
      end
      
    end
  end
end