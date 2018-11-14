def welcome
  puts "Welcome to NYC Data Portal! What's your name?"
  user_name = gets.chomp
  puts "Hi, #{user_name}!"
end

def gets_zip_code
  puts "What's your zip code?"
  user_zip_code = gets.chomp
  user_zip_code
end
