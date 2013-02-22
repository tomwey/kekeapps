class AddAvatarToAppInfos < ActiveRecord::Migration
  def change
    add_attachment :app_infos, :avatar
  end
end
