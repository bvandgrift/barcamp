class TalksController < ApplicationController
  resource_controller
  create.success.flash { "Your pitch was created successfully."}
end
