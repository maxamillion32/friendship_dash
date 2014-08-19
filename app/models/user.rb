class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :participants,
           foreign_key: :health_worker_id,
           dependent: :nullify,
           inverse_of: :health_worker

  validates :pin, :username, presence: true
  before_validation :generate_guid, on: :create
  
  ROLES = ["Researcher", "Supervisor", "Research Assistant", "Health Worker"]

  private

  def generate_guid
    self.guid = SecureRandom.uuid
  end

end
