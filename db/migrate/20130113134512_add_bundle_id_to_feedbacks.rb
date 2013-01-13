class AddBundleIdToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :bundle_id, :string
  end
end
