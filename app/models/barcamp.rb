class Barcamp < ActiveRecord::Base
  named_scope :active, :conditions => {:active => true}
  has_many :acceptances
  has_many :accepted_talks, :through => :acceptances
  has_many :talks
end
