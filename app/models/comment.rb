class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  validates_presence_of :comment
  validates_presence_of :user_id
  validates_presence_of :topic_id

  after_create :increase_post_comment_counter
  # after_destroy :decrease_post_comment_counter

  private

  def increase_post_comment_counter
    Topic.find(self.topic_id).increment(:total_comments_count).save
  end

  # def decrease_post_comment_counter
  #   Post.find(self.post_id).decrement(:total_comments_count).save
  # end
end
