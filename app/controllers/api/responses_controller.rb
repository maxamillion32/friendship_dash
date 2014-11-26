module Api
  class ResponsesController < ApplicationController
    skip_before_action :authenticate_user!
    skip_before_filter  :verify_authenticity_token
    respond_to :json

    def create
      responses = response_params["surveyResponses"]

      if responses

        responses.each do |p|

            user = User.where(guid: p["user_id"]).first
            group = Group.where(group_name: p["group"]).first
            participant = Participant.where(guid: p["patient_id"]).first

            user_id = user.try(:id)
            group_id = group.try(:id)
            participant_id = participant.try(:id)

            p["responses"].each do |key, value|

              survey_question = SurveyQuestion.where(guid: key).first
              survey_question_id = survey_question.try(:id)

              begin
                Response.create(
                  participant_id: participant_id,
                  survey_question_id: survey_question_id,
                  user_id: user_id,
                  group_id: group_id,
                  response_value: value,
                  timestamp: p["created_at"]
              ) unless Response.where(survey_question_id: survey_question_id, group_id: group_id, participant_id: participant_id).any?

              rescue ActiveRecord::RecordNotUnique
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
      params.permit!
    end
  end
end

