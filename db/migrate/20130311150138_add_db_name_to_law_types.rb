class AddDbNameToLawTypes < ActiveRecord::Migration
  def change
    add_column :law_types, :db_name, :string
  end
end
