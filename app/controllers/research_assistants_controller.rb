class ResearchAssistantsController < ApplicationController

  def index
    @research_assistants = User.where(role: "Research Assistant")
  end

  def new
    @user = User.new
  end
end