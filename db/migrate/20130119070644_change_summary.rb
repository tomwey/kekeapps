class ChangeSummary < ActiveRecord::Migration
  
  def change
    change_column :law_details, :summary, :text
  end
  
end
