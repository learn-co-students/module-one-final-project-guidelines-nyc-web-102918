class Opportunity < ActiveRecord::Base
  has_many :users_opportunities
  has_many :users, through: :users_opportunities
end
