class BarcampsController < ApplicationController
  resource_controller
  before_filter :authenticate_user!, :except => :show
  actions :show
end
