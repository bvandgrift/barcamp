class Room < ActiveRecord::Base
  validates_presence_of :name, :barcamp_id
  belongs_to :barcamp
end
