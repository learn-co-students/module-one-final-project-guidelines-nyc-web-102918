def welcome
  puts "Hi, welcome to NYC Volunteer Portal! Your one-stop-shop for all of your New York volunteer needs. To get started, please enter your name:"
  user_name = gets.chomp
  puts "What's your zip code?"
  user_zipcode = gets.chomp.to_i
  new_user = User.create(name: user_name, zipcode: user_zipcode)
  binding.pry

  new_user
end
