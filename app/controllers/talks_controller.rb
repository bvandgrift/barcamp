class TalksController < ApplicationController
  resource_controller
  belongs_to :barcamp
  before_filter :authenticate_user!, :actions => [:new, :create, :edit, :update, :destroy]
  create do
    before do
      object.speaker = current_user
    end
    success.flash { "Your pitch was created successfully."}
  end
  
  private
  
  def parent_object
    super || Barcamp.active.first
  end
end
