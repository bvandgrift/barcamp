class SessionsController < ApplicationController
  resource_controller
  before_filter :authenticate_user!
  belongs_to :barcamp

end
