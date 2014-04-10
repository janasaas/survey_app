class Ynq < ActiveRecord::Base
validates :question, :question_count, presence: true
belongs_to :survey
has_many :results
end
