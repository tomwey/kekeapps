module Api
  module V1
    class FeedbacksController < ApplicationController
      def create
        app_info = AppInfo.find_by_bundle_id(params[:bundle_id])
        @feedback = Feedback.new(:title => params[:title], 
                                 :content => params[:content])
        @feedback.app_info = app_info
        @feedback.save!
      end
    end
  end
end
