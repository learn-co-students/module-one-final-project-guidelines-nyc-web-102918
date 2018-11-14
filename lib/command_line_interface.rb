def welcome
  puts "Hi, welcome to NYC Volunteer Portal! Your one-stop-shop for all of your New York volunteer needs. To get started, please enter your name:"
  user_name = gets.chomp
  # puts "What's your zip code?"
  # user_zipcode = gets.chomp.to_i
  new_user = User.create(name: user_name)
  # new_user
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
  if selection < 1 || selection > 3
    "Sorry, that's an invalid option. Please try again."
  else
    if selection == 1
      categories
    elsif selection == 2
      ""
    else
      ""
    end
  end
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

end
