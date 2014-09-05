module Api
  class ParticipantsController < ApplicationController
    skip_before_action :authenticate_user!
    skip_before_filter  :verify_authenticity_token
    respond_to :json

    def index
      @participants = Participant.all
      render "participants/index.json"
    end

    def create
      participants = participant_params

      Participant.transaction do
        participants.each do |p|
          patient = Participant.find_or_create_by(patient_identifier: p["patient_id"], guid: p["guid"])

          patient.update!(
            first_name: p["first_name"],
            last_name: p["last_name"],
            address: p["address"],
            city: p["city"],
            phone: p["phone"]
          )
          # if !patient
          #   raise ActiveRecord::RecordInvalid
          # end
        end
      end
      
      render json: { success: true, res: "Nice Work" }

      rescue
        render json: { error: "Failed to sync" }, status: 400
    end

    private

    def participant_params
      params.permit(participant: {}, participants: [:patient_id, :first_name, :last_name, :address, :city, :phone, :guid, :timestamp, :created_at]).require(:participants)
    end
  end
end