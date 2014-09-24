class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :research_assistant_managed_participants, class_name: 'Participant', foreign_key: :research_assistant_id
  has_many :health_worker_managed_participants, class_name: 'Participant', foreign_key: :health_worker_id

  validates_confirmation_of :password
  validates :pin, presence: true
  before_validation :generate_guid, on: :create
  before_validation :generate_default_password, on: :create
  
  ROLES = ["Researcher", "Supervisor", "Research Assistant", "Health Worker"]

  private

  def generate_guid
    self.guid = SecureRandom.uuid
  end

  def generate_default_password
    if !self.password
      self.password = SecureRandom.uuid
    end
  end

  def last_and_first_name
    "#{last_name}, #{first_name}"
  end

end