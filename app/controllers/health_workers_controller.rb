class HealthWorkersController < ApplicationController
  before_action :authenticate_user!

  def index
    @health_workers = User.where(role: "Health Worker")
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.where(id: params[:id]).first
  end
end
