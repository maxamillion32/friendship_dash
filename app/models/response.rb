class Response < ActiveRecord::Base
  belongs_to :survey
  belongs_to :participant
  belongs_to :user
end
