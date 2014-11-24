class AddSurveyReferenceToSurveyQuestions < ActiveRecord::Migration
  def change
    add_reference :survey_questions, :survey, index: true
  end
end
