class ChangeColumns < ActiveRecord::Migration
  def change
    change_column :law_details, :content, :text
    change_column :law_details, :catalog, :text
    add_index :law_details, :law_udid, :unique => true
  end
end
