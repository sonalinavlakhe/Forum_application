class AddTotalCommentsCountToTopic < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :total_comments_count, :integer
  end
end
