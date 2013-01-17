class CreateLawDetails < ActiveRecord::Migration
  def change
    create_table :law_details do |t|
      t.string :pub_date
      t.string :title
      t.string :doc_id
      t.string :summary
      t.string :exec_date
      t.string :pub_dept
      t.string :catalog
      t.text :content
      t.integer :version, :default => 1
      t.boolean :visible, :default => true
      t.string :action, :null => false, :default => LawDetail::ACTIONS[0]
      t.integer :law_category_id

      t.timestamps
    end
    
    add_index :law_details, :title
    add_index :law_details, :version
    add_index :law_details, :law_category_id
  end
end
