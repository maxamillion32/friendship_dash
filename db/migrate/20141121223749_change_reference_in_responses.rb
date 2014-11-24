class ChangeReferenceInResponses < ActiveRecord::Migration
  def change
    remove_reference :responses, :survey
    add_reference :responses, :survey_question, index: true
  end
end
