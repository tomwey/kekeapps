class AddLawDetailsCount < ActiveRecord::Migration
  def up
    # add_column :app_infos, :law_details_count, :integer, :default => 0
    # 
    # AppInfo.reset_column_information
    # AppInfo.find_each do |info|
    #   info.reset_counters info.id, :law_details
    # end
    # remove_column :app_infos, :law_details_count
  end

  def down
    # remove_column :app_infos, :law_details_count
  end
end
