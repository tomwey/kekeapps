class CreateAppInfos < ActiveRecord::Migration
  def change
    create_table :app_infos do |t|
      t.string :title
      t.text :description
      t.string :app_url

      t.timestamps
    end
  end
end
