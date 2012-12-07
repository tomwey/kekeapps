class AppInfo < ActiveRecord::Base
  attr_accessible :app_url, :description, :title, :image
  mount_uploader :image, ImageUploader
  
  scope :recent, order('id DESC')

end
