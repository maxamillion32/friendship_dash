class SurveyQuestion < ActiveRecord::Base
    before_validation :generate_guid,  on: :create
    belongs_to :survey
    has_many :responses

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            hashed_row = row.to_hash
            survey = Survey.find_or_create_by(survey_name: hashed_row["survey"])
            Group.find_or_create_by(group_name: hashed_row["group"])
            question_hash = hashed_row.except("survey", "group")
            survey_question = SurveyQuestion.new(question_hash)
            survey_question.survey = survey
            survey_question.save
        end
    end

    def generate_guid
        self.guid = SecureRandom.uuid
    end
end
