class RoomsController < ApplicationController
  inherit_resources
  before_filter :authenticate_user!
  belongs_to :barcamp

end
