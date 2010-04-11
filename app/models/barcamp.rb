class Barcamp < ActiveRecord::Base
  validates_presence_of :title, :start_time, :end_time
  
  named_scope :active, :conditions => {:active => true}

  has_many :acceptances
  has_many :accepted_talks, :through => :acceptances, :source => :talk
  has_many :talks
  has_many :rooms
  has_many :periods do
    def earliest
      find(:first, :order => "start_time")
    end
    def first_after(time = Time.zone.now)
      find(:first, :conditions => ["start_time >= ?", time], :order => "start_time")
    end
    def now(time = Time.zone.now)
      find(:first, :conditions => ["start_time <= ? AND ? <= end_time", time, time], :order => "start_time")
    end
    def first_before(time = Time.zone.now)
      find(:first, :conditions => ["start_time < ?", time], :order => "start_time DESC")
    end
    
  end
  
  def started?(time = Time.zone.now)
    time >= start_time
  end
  
  def finished?(time = Time.zone.now)
    time >= end_time
  end
  
end
