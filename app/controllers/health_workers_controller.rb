class HealthWorkersController < ApplicationController

  def index
    @health_workers = User.where(role: "Health Worker")
  end

  def new
    @user = User.new
  end
end