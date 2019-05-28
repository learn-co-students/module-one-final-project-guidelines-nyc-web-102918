class User < ActiveRecord::Base
  has_many :user_opportunities
  has_many :opportunities, through: :user_opportunities

  def save_to_list(opportunity)
    self.opportunities << opportunity
    puts "#{opportunity.title} has been saved!"
    sleep(0.25)
    puts "Returning to the main menu."
    sleep(1)
  end
end
