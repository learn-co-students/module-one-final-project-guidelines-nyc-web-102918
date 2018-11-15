# User.last

def welcome
  puts "Hi, welcome to NYC Volunteer Portal! Your one-stop-shop for all of your New York volunteer needs. To get started, please enter your name:"
  user_name = gets.chomp
  new_user = User.create(name: user_name)
end

def categories
  puts "We found #{Opportunity.categories.length} categories for you to choose from:"
  puts " "
  Opportunity.categories.each_with_index do |category, i|
    puts "#{i+1} #{category}"
  end
  input = gets.chomp.to_i
  Opportunity.find_by_category(Opportunity.categories[input - 1])
end

def menu_selection
  selection = gets.chomp.to_i
  while selection != 5
    if selection < 1 || selection > 5
      puts "Sorry, that's an invalid option. Please try again."
    else
      if selection == 1
        categories
      elsif selection == 2
        puts "Please enter your zipcode."
        input = gets.chomp.to_i
        Opportunity.find_by_zipcode(input)
      elsif selection == 3
        user_list = User.all.last.opportunities
        if user_list.length == 0
          puts "It looks like you haven't saved any volunteer opportunities yet!"
        else
          puts "Here are your saved results:"
          counter = 0
          print_results(User.all.last.opportunities, counter)
        end
      elsif selection == 4
        user_list = User.all.last.opportunities
        if user_list.length == 0
          puts "It looks like you haven't saved any volunteer opportunities yet!"
        else
          user_categories = User.all.last.opportunities.map do |opp|
            opp.category
          end.uniq.compact
          recommendations = Opportunity.all.select do |opp|
            user_categories.include?(opp.category)
          end
          counter = 0
          while counter < 3
            print_results(recommendations.sample(3), counter)
            counter += 1
          end
        end
      end
      menu_options
      selection = gets.chomp.to_i
    end
  end
end

def print_results(results, counter)
  puts " "
  puts "[#{counter + 1}]"
  puts "TITLE: " + results[counter].title
  puts "ORG: " + results[counter].organization
  puts "DESCRIPTION: " + results[counter].description
  puts " "
  puts "******************"
  puts " "
  sleep(0.5)
end

def goodbye
  puts "Thanks for using the NYC Volunteer Portal! Goodbye."
end

def menu_options
  puts "Hey #{User.all.last.name}, please select from below:"
  puts " "
  # list of categories
  puts "[1] View categories"
  # search by zipcode
  puts "[2] Search by zip code"
  # see saved list
  puts "[3] View saved list"
  # find similar volunteer opportunities (to ones they've saved)
  puts "[4] Recommended for me"
  # exit the program
  puts "[5] Exit"
end
