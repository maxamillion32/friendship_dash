class SupervisorsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @supervisors = User.where(role: "Supervisor")
  end

  def new
    @user = User.new
  end
end