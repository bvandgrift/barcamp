class Talk < ActiveRecord::Base
  
  belongs_to :barcamp
  validates_presence_of :barcamp_id, :speaker_name
  has_one :acceptance
  
  def to_param
    "#{id}-#{title.downcase.gsub(/[^a-z0-9]+/i, '-')}"
  end
end
