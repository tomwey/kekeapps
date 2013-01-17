class ChangeColumn < ActiveRecord::Migration
  def change
    change_column :law_details, :content, :text, :limit => nil
  end
end
