class Group < ActiveRecord::Base
    has_many :survey_collections
    has_many :surveys, through: :survey_collections
end
