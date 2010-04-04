class TalksController < ApplicationController
  resource_controller
  belongs_to :barcamp
  before_filter :authenticate_user!, :actions => [:new, :create, :edit, :update, :destroy]
  
  index.before do
    @talk = parent_object.talks.new
  end
  
  create do
    success do
      flash { "Your pitch was created successfully."}
      wants.html { redirect_to barcamp_talks_path(@barcamp) }
    end
  end
  
  private
  
  def parent_object
    super || Barcamp.active.first || Barcamp.new
  end
end
