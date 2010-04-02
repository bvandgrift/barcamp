class Talk < ActiveRecord::Base
  
  belongs_to :barcamp
  belongs_to :speaker, :class_name => "User"
  validates_presence_of :barcamp_id, :speaker_id
  
  def to_param
    "#{id}-#{title.downcase.gsub(/[^a-z0-9]+/i, '-')}"
  end
end
