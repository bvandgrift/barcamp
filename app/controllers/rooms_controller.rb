class RoomsController < ApplicationController
  resource_controller
  before_filter :authenticate_user!
end
