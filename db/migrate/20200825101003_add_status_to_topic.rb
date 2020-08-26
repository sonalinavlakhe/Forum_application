class AddStatusToTopic < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :status, :boolean, :default=> true
  end
end
