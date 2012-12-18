class AddBundleIdToAppInfos < ActiveRecord::Migration
  def change
    add_column :app_infos, :bundle_id, :string
  end
end
