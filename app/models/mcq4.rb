class Mcq4 < ActiveRecord::Base
validates :question, :a, :b, :c, :d, :question_count, presence: true
belongs_to :survey
has_many :results
end
