class ResearchAssistantsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @research_assistants = User.where(role: "Research Assistant")
  end

  def new
    @user = User.new
  end
end