class SurveyCollection < ActiveRecord::Base
    belongs_to :survey
    belongs_to :group

end
