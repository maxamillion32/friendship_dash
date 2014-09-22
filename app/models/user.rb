class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :research_assistant_managed_participants, class_name: 'Participant', foreign_key: :research_assistant_id
  has_many :health_worker_managed_participants, class_name: 'Participant', foreign_key: :health_worker_id
    

  validates :pin, presence: true
  before_validation :generate_guid, on: :create
  
  ROLES = ["Researcher", "Supervisor", "Research Assistant", "Health Worker"]

  private

  def generate_guid
    self.guid = SecureRandom.uuid
  end

  def last_and_first_name
    "#{last_name}, #{first_name}"
  end

end
