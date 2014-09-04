module Api
  class ParticipantsController < ApplicationController
    skip_before_action :authenticate_user!
    respond_to :json

    def index
      @participants = Participant.all
      render "participants/index.json"
    end

    def create
      participants = JSON.parse(params[:participants])

      participants.each do |p|
        puts p.health_worker_guid
      end
    end

    private

    def participant_params
      params.require(:participant).permit(
          :first_name, :last_name, :patient_identifier,
          :phone, :health_worker_guid, :address, :city
      )
    end
  end
end