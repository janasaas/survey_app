class Survey < ActiveRecord::Base
validates :description, presence: true
belongs_to :user
has_many :mcq4s
has_many :ynqs
has_many :responses
end
