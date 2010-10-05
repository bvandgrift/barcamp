class OmniauthController < ApplicationController
  
  def callback
    if params[:provider] == "twitter"
      twitter
    elsif params[:provider] == "facebook"
      facebook
    end
  end
  
  def twitter
    render :text => request.env["rack.request.query_hash"]["auth"]["user_info"].inspect
    # name, location, nickname, description, image
  end
  
  def facebook
    render :text => request.env["rack.auth"].inspect
  end
  
end
