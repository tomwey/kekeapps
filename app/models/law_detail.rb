class LawDetail < ActiveRecord::Base
  attr_accessible :action, :content, :catalog, :doc_id, :law_category_id, :exec_date, :pub_date, :pub_dept, :summary, :title, :version, :visible
  belongs_to :law_category
  
  ACTIONS = %w(add update delete)
  
  validates_presence_of :action, :content, :summary, :law_category_id, :pub_date, :title, :version, :pub_dept
  validates_numericality_of :version, :greater_than => 0
  
  scope :visibled, where(:visible => true)
  scope :sorted, order('version DESC')
  
  def self.latest_laws_by_version(version)
    where('version > ?', version).sorted.visibled
  end
  
  def as_json(options={})
    {
      :id => id,
      :title => title,
      :pub_date => pub_date,
      :catalog => catalog,
      :summary => summary,
      :content => content,
      :action => action,
      :belong_id => law_category_id,
      :doc_id => doc_id,
      :pub_dept => pub_dept,
      :exec_date => exec_date,
      :version => version
    }
  end
  
end
