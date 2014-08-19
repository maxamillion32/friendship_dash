module Api
  class ParticipantsController < ApplicationController
    skip_before_action :authenticate_user!

    def index
      @participants = Participant.all
      render "participants/index.json"
    end

    def update
    end

  end
end