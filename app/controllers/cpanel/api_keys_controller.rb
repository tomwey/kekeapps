class Cpanel::ApiKeysController < Cpanel::ApplicationController
  
  before_filter :find_api_key
  def show
    
  end
  
  def create
    ApiKey.create!
    render :latest
  end
  
  def update_access_token
    if @api_key
      @api_key.update_access_token
    else
      ApiKey.create!
    end
    redirect_to cpanel_latest_api_key_path
  end
  
  private
  def find_api_key
    @api_key = ApiKey.first
  end
end
