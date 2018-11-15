#!/usr/bin/env ruby

require_relative '../config/environment'
require_relative "../lib/command_line_interface.rb"
require_relative "../lib/api_communicator.rb"
require_relative "../models/user.rb"
require_relative "../models/opportunity.rb"
require_relative "../models/user_opportunity.rb"


# seed_db(request(OPPS))
welcome
menu_options
menu_selection
goodbye

binding.pry

0
