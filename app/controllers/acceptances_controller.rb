class AcceptancesController < ApplicationController
  inherit_resources
  belongs_to :barcamp
 
  before_filter :load_choices, :only => :index

  def create
    create! do |success, failure|
      success.html { redirect_to barcamp_acceptances_path(@barcamp) }
      failure.html { flash[:error] = "No double booking!"; redirect_to barcamp_acceptances_path(@barcamp) }
    end
  end

  private 

  def load_choices
    @talks = parent.talks.find(:all, :include => :acceptance).select{ |t| t.acceptance.nil? }
    @rooms = parent.rooms
    @periods = parent.periods
  end
    
  private
  
  def collection
    @acceptances ||= end_of_association_chain.find(:all, :include => [:room, :period], :order => "rooms.name, periods.start_time")
  end
end
