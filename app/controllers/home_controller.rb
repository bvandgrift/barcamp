class HomeController < ApplicationController
  
  def index
    @barcamp = Barcamp.active.find(:first, :include => :periods)
    render :template => "home/none" and return unless @barcamp
    @time    = if params[:fake_time]
      Time.zone.parse(params[:fake_time]) 
    else
      Time.zone.now
    end
    @next_period  = @barcamp.periods.first_after(@time)
    
   if @next_period
    @next_talks = @barcamp.acceptances.find(:all, :conditions => {:period_id => @next_period})
     @now          = @next_period.previous_period
     if @now
       @now_talks = @barcamp.acceptances.find(:all, :conditions => {:period_id => @now})
     end
    else
      # need to handle last period of the day
      @now          = @barcamp.periods.find(:first, :order => "start_time DESC")
     if @now
       @now_talks = @barcamp.acceptances.find(:all, :conditions => {:period_id => @now})
     end
   end
  end
  
end
