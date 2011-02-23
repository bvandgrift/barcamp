class AcceptancesController < ApplicationController
  inherit_resources
  belongs_to :barcamp
 
  before_filter :load_choices, :only => :index

  def create
    create!{ barcamp_acceptances_path(@barcamp) }
  end

  private 

  def load_choices
    @talks = parent_object.talks.find(:all, :include => :acceptance).select{ |t| t.acceptance.nil? }
    @rooms = parent_object.rooms
    @periods = parent_object.periods
  end
    
  private
  
  def collection
    @collection ||= end_of_association_chain.find(:all, :include => [:room, :period], :order => "rooms.name, periods.start_time")
  end
end
