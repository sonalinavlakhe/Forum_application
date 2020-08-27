class CommentsController < ApplicationController
   before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id if user_signed_in?
    if @comment.save
      update_topic_status
      redirect_to topic_path(@comment.topic.id), flash: {success: 'Comment was created successfully!'}
    else
      redirect_to topic_path(@comment.topic.id), flash: {danger: @comment.errors.full_messages.join(' ')}
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :topic_id, :is_closed)
  end

  def update_topic_status
    if params[:is_closed].present?
      topic = Topic.find(params[:comment][:topic_id])
      topic.update(status: "CLOSED")
    end
  end
end