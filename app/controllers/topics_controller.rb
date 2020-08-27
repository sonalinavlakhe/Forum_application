class TopicsController < ApplicationController

  def new
    @topic = current_user.topics.new
  end

  def create
    @topic = current_user.topics.new(topic_params)
    if @topic.save
      redirect_to dashboard_path, success: "Topic Created successfully!"
    else
      redirect_to new_topic_path, danger: @topic.errors.full_messages.join(' ')
    end
  end

  def show
    @topic = Topic.find(params[:id]) if params[:id].present?
    @comments = Comment.new
    @comments = Comment.where(topic_id: @topic.id)
  end

  def search
    @topics = Topic.where("subject ILIKE ?", "%" + params[:q] + "%").order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    if @topics.present?
      flash.now[:success] = "Search result found!"
    else
      flash.now[:info] = "Thread does not exists please create new thread"
    end
    render 'users/index'
  end

  private

  def topic_params
    params.require(:topic).permit(:subject, :content)
  end
end
