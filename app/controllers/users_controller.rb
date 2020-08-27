class UsersController < ApplicationController
  before_action :authenticate_user!, :except => [:index] 

  def index
    @topics = Topic.order(created_at: :desc)
  end

  def show
  end
end
