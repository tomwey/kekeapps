module Api
  module V1
    class NewsBlastsController < Api::ApplicationController
      before_filter :restrict_access
      
      def index
        @news_blasts = NewsBlast.recent
        respond_with(@news_blasts)
      end
      
    end
  end
end