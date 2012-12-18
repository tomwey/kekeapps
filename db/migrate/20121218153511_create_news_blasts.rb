class CreateNewsBlasts < ActiveRecord::Migration
  def change
    create_table :news_blasts do |t|
      t.string :title
      t.text :content
      t.string :link

      t.timestamps
    end
  end
end
