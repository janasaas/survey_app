class Response < ActiveRecord::Base
belongs_to :survey
belongs_to :agent
belongs_to :surveyee
has_many :results
end
