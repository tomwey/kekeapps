class AddAppleIdToAppInfos < ActiveRecord::Migration
  def change
    add_column :app_infos, :apple_id, :string
  end
end
