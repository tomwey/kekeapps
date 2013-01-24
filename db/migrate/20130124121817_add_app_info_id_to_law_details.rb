class AddAppInfoIdToLawDetails < ActiveRecord::Migration
  def change
    add_column :law_details, :app_info_id, :integer
    add_index :law_details, :app_info_id
  end
end
