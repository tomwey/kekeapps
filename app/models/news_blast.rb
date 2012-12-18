class NewsBlast < ActiveRecord::Base
  attr_accessible :content, :link, :title
  
  validates_presence_of :content, :title, :link
  
  scope :recent, order('id DESC')
  
end
