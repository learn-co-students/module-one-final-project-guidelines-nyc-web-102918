class User < ActiveRecord::Base
  has_many :user_opportunities
  has_many :opportunities, through: :user_opportunities
end
