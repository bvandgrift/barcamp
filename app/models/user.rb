class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :registerable, :rememberable, 
          :omniauthable, :trackable, :validatable
  
  has_many :talks

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    if user = User.find_by_email(data["email"])
      user
    else # Create an user with a stub password. 
      User.create!(:email => data["email"], :password => Devise.friendly_token[0,20]) 
    end
  end 
  
end
