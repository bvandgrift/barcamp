class PeriodsController < ApplicationController
  inherit_resources
  before_filter :authenticate_user!
  belongs_to :barcamp

  before_filter :set_times, :only => :new
  
  def set_times
    resource.start_time = parent.start_time
    resource.end_time = parent.end_time
  end
end
