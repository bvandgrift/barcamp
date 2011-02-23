module ApplicationHelper

  def page_title
    if @barcamp
      @barcamp.title
    else
      "BarCamp Schedule"
    end
  end

end
