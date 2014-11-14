module Api
  class ParticipantsController < ApplicationController
    skip_before_action :authenticate_user!
    skip_before_filter  :verify_authenticity_token
    respond_to :json

    def index
      @participants = Participant.where(status: "active")
      render "participants/index.json"
    end

    def create
      participants = participant_params

      if participants
        Participant.transaction do
          participants.each do |p|

            begin
              ra = User.where(guid: p["research_assistant_id"]).first

              ra_id = ra.try(:id)

              Participant.create({
                guid: p["guid"],
                patient_identifier: p["patient_identifier"],
                first_name: p["first_name"],
                last_name: p["last_name"],
                address: p["address"],
                city: p["city"],
                phone: p["phone"],
                clinic: p["clinic"],
                research_assistant_id: ra_id
            }) unless Participant.where(guid: p["guid"]).any?

            rescue ActiveRecord::RecordNotUnique
              retry
            end
          end
        end
        render json: { success: true, res: "Nice Work" }
      else
        render json: { error: true, res: "No patient data sent" }

      end
    end

    private

    def participant_params
      params.permit(participant: {}, participants: [:patient_identifier, :clinic, :first_name, :last_name, :address, :city, :phone, :guid, :research_assistant_id, :timestamp, :created_at]).require(:participants)
    end
  end
end
