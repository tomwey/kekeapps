class AppInfo < ActiveRecord::Base
  attr_accessible :app_url, :description, :title, :image
  mount_uploader :image, ImageUploader
<<<<<<< HEAD
  
  scope :recent, order('id DESC')
=======
>>>>>>> b38ed4179a3d7bf2dd826a2ba337a6c83f029f19
end
