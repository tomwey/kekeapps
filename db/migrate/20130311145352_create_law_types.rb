class CreateLawTypes < ActiveRecord::Migration
  def change
    create_table :law_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
