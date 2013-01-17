class AddLawUdidToLawDetails < ActiveRecord::Migration
  def change
    add_column :law_details, :law_udid, :string
  end
end
