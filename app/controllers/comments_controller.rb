class CommentsController < ApplicationController
   before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id if user_signed_in?
    if @comment.save
      redirect_to topic_path(@comment.topic.id), flash: {success: 'Comment was created successfully!'}
    else
      redirect_to topic_path(@comment.topic.id), flash: {denger: 'Comment was not saved!'}
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :topic_id)
  end
end