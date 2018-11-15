class Opportunity < ActiveRecord::Base


  has_many :users_opportunities
  has_many :users, through: :users_opportunities


  def self.categories
    categories = self.all.map do |opp|
      opp.category
    end.uniq.compact
  end

  def self.find_by_zipcode(zipcode)
    counter = 0
    current_user = User.all.last
    results = Opportunity.all.select do |opp|
      opp.zipcode == zipcode
    end
    if results.length == 0
      puts "Sorry, there are currently no opportunities in this area."
    elsif results.length > 10
      while counter < 10 do
        print_results(results, counter)
        counter += 1
     end
   else
     results.each do |result|
       print_results(results, counter)
       counter += 1
     end
   end
   save_or_return(current_user, results)
  end

  def self.find_by_category(user_category)
    counter = 0
    current_user = User.all.last
    results = Opportunity.all.select do |opp|
      opp.category == user_category
    end
    while counter < 10 do
      print_results(results, counter)
      counter += 1
    end
    save_or_return(current_user, results)
  end

end
