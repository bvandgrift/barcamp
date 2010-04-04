class PeriodsController < ApplicationController
  resource_controller
  before_filter :authenticate_user!
  belongs_to :barcamp
  new_action.before do
    object.start_time = @barcamp.start_time
    object.end_time = @barcamp.end_time
  end
end
