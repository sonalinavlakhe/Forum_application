class AddUsernameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, limit: 50
  end
end
