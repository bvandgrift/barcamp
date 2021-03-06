class HomeController < ApplicationController
  
  layout "default"
  
  def index
    # All responses save for 5 minutes, barring shift-refresh
    response.headers['Cache-Control'] = 'public, max-age=60'
    @barcamp = Barcamp.active.find(:first, :include => :periods)
    render :template => "home/none" and return unless @barcamp
    @time    = Time.zone.now # depending on Timecop for anything else
    render :template => "home/notyet" and return unless @barcamp.started?(@time)
    render :template => "home/thanks" and return if @barcamp.finished?(@time)    
    
    # we know barcamp exists and has started.  Is there something happening now?
    @now = @barcamp.periods.now(@time)
    next_block = @now.nil? ? @time : @now.end_time
    # Will there be something happening soon?
    @next_period  = @barcamp.periods.first_after(next_block)
    if @next_period
      @next_talks = find_talks(@next_period)
    else
      @next_message = "Thanks for attending!"
    end
    
    if @now.nil?
      # BarCamp has started, but there's no active session.
      if @time < @barcamp.periods.earliest.start_time
        @now_message = "#{@barcamp.title} is being planned right now.  Is your pitch ready?"
      else
        @now_message = if @next_talks.any?
          "Socialize, but find your seats for the next session!"
        else
          "We're plotting our afternoon sessions.  Stay tuned!"
        end
      end
    else
      @now_talks = find_talks(@now)
    end
    
  end
  
  private 
  
  def find_talks(period)
    @barcamp.acceptances.find(:all, :include => :room,
      :conditions => {:period_id => period}, :order => "rooms.name")
  end
  
end
