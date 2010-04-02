class AcceptancesController < ApplicationController
  resource_controller
  belongs_to :barcamp
  
  index do
    before do
      @talks = parent_object.talks
      @rooms = Room.all
    end
  end

end
