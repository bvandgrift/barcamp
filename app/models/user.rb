class User < ActiveRecord::Base
  devise :authenticatable, :recoverable, :registerable, :rememberable, :trackable, :validatable
  
  has_many :talks
end
