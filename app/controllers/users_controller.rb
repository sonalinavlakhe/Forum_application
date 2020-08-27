class UsersController < ApplicationController
  before_action :authenticate_user!, :except => [:index] 

  def index
    @topics = Topic.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end
end
