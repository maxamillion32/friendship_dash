module Api
  class SurveyQuestionsController < ApplicationController
    skip_before_action :authenticate_user!
    skip_before_filter  :verify_authenticity_token
    respond_to :json

    def index
      @survey_questions = SurveyQuestion.all
      render "survey_questions/index.json"
    end
  end
end
