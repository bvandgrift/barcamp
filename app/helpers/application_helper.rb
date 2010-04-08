# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def page_title
    if @barcamp
      @barcamp.title
    else
      "BarCamp Schedule"
    end
  end
end
