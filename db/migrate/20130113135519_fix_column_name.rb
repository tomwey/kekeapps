class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :feedbacks, :bundle_id, :app_info_id
  end
end
