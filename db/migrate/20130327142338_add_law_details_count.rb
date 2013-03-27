class AddLawDetailsCount < ActiveRecord::Migration
  def up
    add_column :app_infos, :law_details_count, :integer, :default => 0
    
    AppInfo.reset_column_information
    AppInfo.all.each do |info|
      info.update_attribute :law_details_count, info.law_details.length
    end
  end

  def down
    remove_column :app_infos, :law_details_count
  end
end
