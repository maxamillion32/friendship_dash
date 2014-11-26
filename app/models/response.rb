class Response < ActiveRecord::Base
  belongs_to :survey_question
  belongs_to :participant
  belongs_to :user
  belongs_to :group

  before_validation :generate_guid,  on: :create

    def generate_guid
        self.guid = SecureRandom.uuid
    end
end
