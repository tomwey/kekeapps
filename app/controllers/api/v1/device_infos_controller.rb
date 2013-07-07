module Api
  module V1
    class DeviceInfosController < Api::ApplicationController
      
      before_filter :restrict_access
      
      def create
        @device_info = DeviceInfo.where(:device_token => params[:device_token]).first_or_create
        if @device_info
          render json: { code: 201 }
        else
          render json: { code: 400 }
        end
      end
      
    end
  end
end