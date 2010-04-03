class Barcamp < ActiveRecord::Base
  named_scope :active, :conditions => {:active => true}

  has_many :acceptances
  has_many :accepted_talks, :through => :acceptances, :source => :talk
  has_many :talks
  has_many :rooms
end
