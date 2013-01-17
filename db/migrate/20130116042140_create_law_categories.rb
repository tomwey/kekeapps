class CreateLawCategories < ActiveRecord::Migration
  def change
    create_table :law_categories do |t|
      t.string :name
      t.text :description
      t.boolean :visible, default: true

      t.timestamps
    end
  end
end
