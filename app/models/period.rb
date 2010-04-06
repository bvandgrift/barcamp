class Period < ActiveRecord::Base
  belongs_to :barcamp
  validates_presence_of :barcamp_id, :name, :start_time, :end_time
  
  def previous_period
    barcamp.periods.first_before(start_time)
  end
end
