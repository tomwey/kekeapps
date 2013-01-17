class LawCategory < ActiveRecord::Base
  attr_accessible :description, :name, :visible
  
  has_many :law_datas, :foreign_key => "parent_id"
  
  def self.category_collection
    @categories ||= LawCategory.all
    @categories.collect { |c| [c.name, c.id] }
  end
end
