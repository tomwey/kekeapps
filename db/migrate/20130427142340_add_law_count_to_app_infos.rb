class AddLawCountToAppInfos < ActiveRecord::Migration
  def self.up
    add_column :app_infos, :law_details_count, :integer, :default => 0
    AppInfo.reset_column_information
    AppInfo.find_each do |app_info|
      AppInfo.reset_counters app_info.id, :law_details
    end
    # remove_column :app_infos, :law_details_count
  end
  
  def self.down
    remove_column :app_infos, :law_details_count
  end
end
