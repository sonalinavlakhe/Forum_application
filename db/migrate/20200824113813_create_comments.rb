class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user
      t.references :topic
      t.text :comment
      t.timestamp
    end
  end
end
