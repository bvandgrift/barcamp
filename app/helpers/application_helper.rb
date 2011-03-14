module ApplicationHelper
  def logged_in?
    current_user
  end

  def admin?
    logged_in? && current_user.admin?
  end

  def page_title
    if @barcamp
      @barcamp.title
    else
      "BarCamp Schedule"
    end
  end
  
end
