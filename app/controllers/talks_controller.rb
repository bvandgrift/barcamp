class TalksController < ApplicationController
  resource_controller
  before_filter :authenticate_user!, :actions => [:new, :create, :edit, :update, :destroy]
  create do
    before do
      object.speaker = current_user
      object.barcamp = Barcamp.active.first
    end
    success.flash { "Your pitch was created successfully."}
  end
    
end
