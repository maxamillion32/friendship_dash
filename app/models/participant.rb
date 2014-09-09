class Participant < ActiveRecord::Base
  belongs_to :health_worker, class_name: "User", foreign_key: :health_worker_id
  belongs_to :research_assistant, class_name: "User", foreign_key: :research_assistant_id

  validates :patient_identifier, presence: true
  validates :patient_identifier, uniqueness: true
end