#!/usr/bin/env ruby

require_relative '../config/environment'

require_relative "../lib/command_line_interface.rb"
require_relative "../lib/api_communicator.rb"

puts "HELLO WORLD"

welcome
zip_code = gets_zip_code

binding.pry

0
