class AppInfo < ActiveRecord::Base
  attr_accessible :app_url, :description, :title, :image
  
  validates :app_url, :presence => true
  validates :title, :presence => true
  
  mount_uploader :image, ImageUploader
  
  scope :recent, order('id DESC')
end
