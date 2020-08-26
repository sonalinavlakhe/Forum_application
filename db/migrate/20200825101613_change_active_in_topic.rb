class ChangeActiveInTopic < ActiveRecord::Migration[5.2]
  def change
    change_column :topics, :active, :boolean, :default=> true
  end
end
