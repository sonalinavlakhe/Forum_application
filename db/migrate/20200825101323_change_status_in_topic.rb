class ChangeStatusInTopic < ActiveRecord::Migration[5.2]
  def change
    change_column :topics, :status, :string, :default=> 'OPEN'
  end
end
