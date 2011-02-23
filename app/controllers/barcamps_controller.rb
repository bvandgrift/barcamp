class BarcampsController < ApplicationController
  inherit_resources
  before_filter :authenticate_user!, :except => :show
  actions :show
end
