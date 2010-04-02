class User < ActiveRecord::Base
  devise :authenticatable, :confirmable, :recoverable, :rememberable, :trackable, :validatable
end
