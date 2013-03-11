class AddLawTypeIdToLawDetails < ActiveRecord::Migration
  def change
    add_column :law_details, :law_type_id, :integer
  end
end
