class Opportunity < ActiveRecord::Base


  has_many :users_opportunities
  has_many :users, through: :users_opportunities


  def self.categories
    categories = self.all.map do |opp|
      opp.category
    end.uniq
    puts "We found #{categories.length} categories for you to choose:"
    categories.each_with_index do |category, i|
      if category != nil
        puts "#{i+1} #{category}"
      end
    end
  end

  def self.find_by_category(user_category)
    counter = 0
    results = Opportunity.all.select do |opp|
      opp.category == user_category
    end
    while counter < 10 do
    # results.each do |result|
      puts "TITLE: " + results[counter].title
      puts "ORG: " + results[counter].organization
      puts "DESCRIPTION: " + results[counter].description
      puts " "
      puts "******************"
      puts " "
      counter += 1
    end
  end

end
