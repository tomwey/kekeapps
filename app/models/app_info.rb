class AppInfo < ActiveRecord::Base
  attr_accessible :app_url, :description, :title, :image, :apple_id, :bundle_id
  
  validates :app_url, :presence => true
  validates :title, :presence => true
  validates :apple_id, :presence => true
  validates :bundle_id, :presence => true
  
  mount_uploader :image, ImageUploader
  
  scope :recent, order('id DESC')
  
  def as_json(options={})
    {
      :id => id,
      :app_name => title,
      :app_url => app_url,
      :apple_id => apple_id,
      :app_intro => description,
      :app_icon_url => image.url(:thumb)
    }
  end
  
end
