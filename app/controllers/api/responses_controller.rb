module Api
  class ResponsesController < ApplicationController
    skip_before_action :authenticate_user!
    skip_before_filter  :verify_authenticity_token
    respond_to :json

    def create
      responses = response_params

      if responses

        Response.transaction do

          responses.each do |p|

            p["responses"].each do |key, value|

              begin
                user = User.where(guid: p["research_assistant_id"]).first
                survey = Survey.where(guid: key).first
                participant = Participant.where(guid: p["patient_id"]).first

                user_id = user.try(:id)
                survey_id = survey.try(:id)
                participant_id = participant.try(:id)

                Response.create({
                  guid: p["guid"],
                  participant_id: participant_id,
                  survey_id: survey_id,
                  user_id: user_id,
                  response_value: value,
                  timestamp: p["timestamp"]
              }) unless Response.where(guid: p["guid"]).any?

              rescue ActiveRecord::RecordNotUnique
                retry
              end
            end
          end
        end
        render json: { success: true, res: "Nice Work" }
      else
        render json: { error: true, res: "No response data sent" }

      end
    end

    private

    def response_params
      params.permit(response: {}, responses: [ :guid, :participant_id, :user_id, :timestamp, responses: {}]).require(:responses)
    end
  end
end
