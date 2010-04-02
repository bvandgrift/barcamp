class Acceptance < ActiveRecord::Base
  belongs_to :barcamp
  belongs_to :room
  belongs_to :talk
  
  before_create :validate_acceptance
  
  attr_accessor :accepted
  def validate_acceptance
    errors.add_to_base "Check the box to accept this talk" unless @accepted
  end
end
