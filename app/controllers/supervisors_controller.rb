class SupervisorsController < ApplicationController

  def index
    @supervisors = User.where('role=? OR role=?', 'Supervisor', 'Researcher')
  end
end