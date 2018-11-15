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
    results = Opportunity.all.select do |opp|
      opp.zipcode == zipcode
    end
    if results.length == 0
      puts "Sorry, there are no opportunities in this area."
    elsif results.length > 10
      while counter < 10 do
        print_results(results, counter)
        # puts " "
        # puts "[#{counter + 1}]"
        # puts "TITLE: " + results[counter].title
        # puts "ORG: " + results[counter].organization
        # puts "DESCRIPTION: " + results[counter].description
        # puts " "
        # puts "******************"
        # puts " "
        counter += 1
     end
   else
     results.each do |result|
       print_results(results, counter)
       # puts " "
       # puts "[#{counter + 1}]"
       # puts "TITLE: " + results[counter].title
       # puts "ORG: " + results[counter].organization
       # puts "DESCRIPTION: " + results[counter].description
       # puts " "
       # puts "******************"
       # puts " "
       counter += 1
       # sleep(0.5)
     end
   end
   puts "Enter a number to save to your list"
   input = gets.chomp.to_i
   UserOpportunity.create(user: User.all.last, opportunity: results[input - 1])
   puts "#{results[input - 1].title} has been saved!"
  end

  def self.find_by_category(user_category)
    counter = 0
    results = Opportunity.all.select do |opp|
      opp.category == user_category
    end
    while counter < 10 do
      print_results(results, counter)
      # puts " "
      # puts "[#{counter + 1}]"
      # puts "TITLE: " + results[counter].title
      # puts "ORG: " + results[counter].organization
      # puts "DESCRIPTION: " + results[counter].description
      # puts " "
      # puts "******************"
      # puts " "
      counter += 1
      # sleep(0.5)
    end
    # Please enter 'Save' to save to your list, or 'Back' to return to the main menu_options
    # input = gets.chomp
    puts "Enter a number to save to your list"
    input = gets.chomp.to_i
    UserOpportunity.create(user: User.all.last, opportunity: results[input - 1])
    puts "#{results[input - 1].title} has been saved!"
  end

end
