class User < ActiveRecord::Base
  devise :authenticatable, :confirmable, :recoverable, :registerable, :rememberable, :trackable, :validatable
end
