class Group < ActiveRecord::Base
    has_many :survey_collections, -> {order "position"}, dependent: :destroy
    has_many :surveys, through: :survey_collections

    before_validation :generate_guid,  on: :create

    def generate_guid
        self.guid = SecureRandom.uuid
    end
end
