class AppInfo < ActiveRecord::Base
  attr_accessible :app_url, :description, :title, :avatar, :apple_id, :bundle_id
  
  has_many :feedbacks
  has_many :law_details
  
  validates :app_url, :presence => true
  validates :title, :presence => true
  validates :apple_id, :presence => true
  validates :bundle_id, :presence => true
  
  # mount_uploader :image, ImageUploader
  has_attached_file :avatar, 
                    :storage => :dropbox, 
                    :dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
                    :styles => { :thumb => "40x40" },
                    :dropbox_options => { :path => proc { |style| "#{style}/#{id}_#{avatar.original_filename}" } }

  scope :recent, order('id DESC')
  
  def self.app_collection
    @apps ||= AppInfo.all
    @apps.collect { |app| [app.title, app.id] }
  end
  
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
