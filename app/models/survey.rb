class Survey < ActiveRecord::Base
    has_many :survey_questions
    has_many :survey_collections
    has_many :groups, through: :survey_collections
    before_validation :generate_guid,  on: :create

      def generate_guid
        self.guid = SecureRandom.uuid
    end
end
