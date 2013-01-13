class Feedback < ActiveRecord::Base
  attr_accessible :content, :title, :app_info_id
  
  belongs_to :app_info
  
  validates_presence_of :content, :app_info_id
  
  scope :recent, order('created_at DESC')
  
  def app_name
    app_info.title
  end
  
end
