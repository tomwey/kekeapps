class LawType < ActiveRecord::Base
  attr_accessible :name, :db_name
  
  has_many :law_details
  
  def self.type_names
    @types ||= LawType.all
    @types.collect { |c| [c.name, c.id] }
  end
end
