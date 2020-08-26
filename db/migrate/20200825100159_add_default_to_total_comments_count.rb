class AddDefaultToTotalCommentsCount < ActiveRecord::Migration[5.2]
  def change
    change_column :topics, :total_comments_count, :integer, :default=> 0
  end
end
