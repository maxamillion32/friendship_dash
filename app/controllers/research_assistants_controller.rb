class ResearchAssistantsController < ApplicationController

  def index
    @research_assistants = User.where(role: "Research Assistant")
  end
end