class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :subject
      t.text :content
      t.boolean :active
      t.references :user
      t.timestamps
    end
  end
end
