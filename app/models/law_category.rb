class LawCategory < ActiveRecord::Base
  attr_accessible :description, :name, :visible
  
  has_many :law_datas, :foreign_key => "parent_id"
end
