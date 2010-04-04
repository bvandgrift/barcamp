class AcceptancesController < ApplicationController
  resource_controller
  belongs_to :barcamp
  
  index do
    before do
      @talks = parent_object.talks.find(:all, :include => :acceptance).select{ |t| t.acceptance.nil? }
      @rooms = parent_object.rooms
      @periods = parent_object.periods
    end
  end
  
  create do
    failure.wants.html do
      flash[:error] = object.errors.full_messages.to_sentence
      redirect_to barcamp_acceptances_path(@barcamp)
    end 
    wants.html { redirect_to barcamp_acceptances_path(@barcamp) }
  end
  
  private
  
  def collection
    @collection ||= end_of_association_chain.find(:all, :include => [:room, :period], :order => "rooms.name, periods.start_time")
  end
end
