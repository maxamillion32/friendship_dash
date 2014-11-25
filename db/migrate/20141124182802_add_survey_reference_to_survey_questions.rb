class AddSurveyReferenceToSurveyQuestions < ActiveRecord::Migration
  def change
    if ActiveRecord::Base.connection.table_exists? 'survey_questions'
      add_reference :survey_questions, :survey, index: true
    end
  end
end
