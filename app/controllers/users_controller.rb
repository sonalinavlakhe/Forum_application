class UsersController < ApplicationController
  before_action :authenticate_user!, :except => [:index] 

  def index
    @topics = Topic.all
  end

  def show
  end
end
