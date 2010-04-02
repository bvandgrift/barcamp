class Acceptance < ActiveRecord::Base
  belongs_to :barcamp
  belongs_to :room
  belongs_to :talk
end
