class SupervisorsController < ApplicationController

  def index
    @supervisors = User.where(role: "Supervisor")
  end

  def new
    @user = User.new
  end
end