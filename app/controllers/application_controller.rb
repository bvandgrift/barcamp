class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  layout "default"
  
  before_filter :load_barcamp
  
  def load_barcamp
    @barcamp = Barcamp.active.first
  end
  
end
