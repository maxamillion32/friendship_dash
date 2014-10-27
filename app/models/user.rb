class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable

  has_many :research_assistant_managed_participants, class_name: 'Participant', foreign_key: :research_assistant_id
  has_many :health_worker_managed_participants, class_name: 'Participant', foreign_key: :health_worker_id

  validates_confirmation_of :password
  validates :pin, presence: true
  validates :pin, uniqueness: true
  validates_length_of :pin, minimum: 5, maximum: 5, allow_blank: false

  before_validation :generate_guid, on: :create
  before_validation :generate_default_password, on: :create
  before_validation :assign_pin, on: :create

  ROLES = ["Researcher", "Supervisor", "Research Assistant", "Health Worker"]
  validates :role, inclusion: { in: ROLES }

  def last_and_first_name
    "#{last_name}, #{first_name}"
  end

  private

  def generate_guid
    self.guid = SecureRandom.uuid
  end

  def generate_default_password
    if !self.password
      self.password = SecureRandom.uuid
    end
  end

  def assign_pin
    self.pin = User.generate_five_digit_pin
    self.assign_pin while User.where(pin: pin).any?
  end

   def self.generate_five_digit_pin
    '%05d' % rand(10**5).to_s
  end
end
