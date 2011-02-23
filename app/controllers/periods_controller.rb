class PeriodsController < ApplicationController
  inherit_resources
  before_filter :authenticate_user!
  belongs_to :barcamp
  
  def new
    new! do
      @period.start_time = parent.start_time
      @period.end_time = parent.end_time
    end
  end
end
