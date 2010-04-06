class Barcamp < ActiveRecord::Base
  named_scope :active, :conditions => {:active => true}

  has_many :acceptances
  has_many :accepted_talks, :through => :acceptances, :source => :talk
  has_many :talks
  has_many :rooms
  has_many :periods do
    def first_after(time = Time.zone.now)
      find(:first, :conditions => ["start_time >= ?", time], :order => "start_time")
    end
    def first_before(time = Time.zone.now)
      find(:first, :conditions => ["start_time < ?", time], :order => "start_time DESC")
    end
    
  end
end
