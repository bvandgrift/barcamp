class Acceptance < ActiveRecord::Base
  belongs_to :barcamp
  belongs_to :room
  belongs_to :talk
  belongs_to :period
  
  validates_presence_of :barcamp_id, :room_id, :talk_id, :period_id
  validates_uniqueness_of :talk_id, :scope => :barcamp_id, :message => "can be scheduled only once per Barcamp"
  validates_uniqueness_of :room_id, :scope => :period_id, :message => "cannot be used twice in the same session. No double booking!"  
  
end
