class LawDetail < ActiveRecord::Base
  attr_accessible :action, :content, :catalog, :doc_id, 
                  :law_category_id, :exec_date, :pub_date, :pub_dept, 
                  :summary, :title, :version, :visible, :law_udid,
                  :app_info_id, :law_type_id
  
  belongs_to :law_category
  belongs_to :app_info#, :counter_cache => true
  belongs_to :law_type
  
  ACTIONS = %w(add update delete)
  
  validates_presence_of :action, :content, :app_info_id, :law_type_id, :version, :pub_date, :title, :pub_dept
  validates_numericality_of :version, :greater_than => 0
  validates_uniqueness_of :law_udid
  
  scope :visibled, where(:visible => true)
  scope :sorted, order('version DESC')
  
  def self.latest_laws_by_version(version)
    where('version > ?', version).sorted.visibled
  end
  
  def category_name
    law_category.try(:name)
  end
  
  def law_type_name
    law_type.try(:name)
  end
  
  def app_title
    app_info.try(:title)
  end
  
  def db_name
    law_type.nil? ? '' : law_type.db_name
  end
  
  # before_create :set_law_udid
  # def set_law_udid
  #   if new_record?
  #     array = []
  #     6.times do
  #       array << rand(9) + 1;
  #     end
  #     self.law_udid = array.join('')
  #   end
  # end
  
  before_create do |law_detail|
    if new_record?
      if law_detail.law_udid.blank?
        array = []
        6.times do
          array << rand(9) + 1;
        end
        self.law_udid = array.join('')
      else
        self.law_udid = law_detail.law_udid
      end
    end
  end
  
  before_save :set_version
  def set_version
    version = LawDetail.visibled.maximum("version")
    unless version
      version = 1
    end
    self.version = version+1
  end
  
  def as_json(options={})
    {
      :title => title,
      :pub_date => pub_date,
      :catalog => catalog,
      :government_ling => summary,
      :content => content,
      :action => action,
      :belong_id => law_category_id,
      :doc_number => doc_id,
      :pub_dept => pub_dept,
      :impl_date => exec_date,
      :version => version,
      :law_id => law_udid,
      :db_name => db_name
    }
  end
  
end
