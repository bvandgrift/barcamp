class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :registerable, :rememberable, 
          :omniauthable, :trackable, :validatable
  
  has_many :talks

  def self.new_with_session(params, session)
    user = new(params)
    if session["devise.twitter_data"]
      data = session["devise.twitter_data"]["user_info"]
      user.attributes = {:handle => data["nickname"], :avatar_url => data["image"], 
                         :oauth_provider => "twitter"}
    end
    user
  end
  

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['user_info']
    if user = User.find_by_email(data["email"])
      user
    else # Create an user with a stub password. 
      User.create!(:email => data["email"], :password => Devise.friendly_token[0,20],
                  :oauth_provider => "facebook", :handle => data["nickname"] ) 
    end
  end 
  
  
  def self.find_for_twitter_oauth(access_token, signed_in_resource=nil)
    if signed_in_resource
      # Already signed in, update their info and return the record.
      signed_in_resource
    end
    data = access_token["user_info"]
    if user = User.where(:oauth_provider => "twitter").where(:handle => data["nickname"]).limit(1).first()
      user
    else 
      # We can't save the user immediately; twitter doesn't ship e-mail 
      # We can punt totally here because we'll get routed back through User.new_with_session above [jvf]
      User.new
    end
  end 

 protected
  # we don't need a password just yet if you came in via oauth.
  def password_required?
    !oauth_provider 
  end
  
  
end
