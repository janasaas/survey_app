class Result < ActiveRecord::Base
  belongs_to :mcq4
  belongs_to :ynq
  belongs_to :response
end
