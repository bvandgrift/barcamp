class TalksController < ApplicationController
  inherit_resources
  belongs_to :barcamp
  before_filter :authenticate_user!, :actions => [:new, :create, :edit, :update, :destroy]
  
  before_filter :initialize_talk, :only => :index
  
  def initialize_talk
    @talk = parent_object.talks.new
  end

  def create
    create!(:notice => "Your pitch was recorded successfully."){ barcamp_talks_path(@barcamp) }
  end
  
  private
  
  def parent
    super || Barcamp.active.first
  end
end
