class Participant < ActiveRecord::Base
  belongs_to :health_worker, class_name: "User", foreign_key: :health_worker_id

  validates :patient_identifier, presence: true
  validates :patient_identifier, uniqueness: true

  before_validation :generate_guid, on: :create

  def generate_guid
    self.guid = SecureRandom.uuid
  end
end