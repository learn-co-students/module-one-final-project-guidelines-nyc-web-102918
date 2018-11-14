require 'rest-client'
require 'json'
require 'pry'

OPPS = "https://data.cityofnewyork.us/resource/n4ac-3636.json"

def request(url)
  response_string = RestClient.get(url)
  response_hash = JSON.parse(response_string)
  response_hash
end

def seed_db(response_array)
  Opportunity.destroy_all
  response_array.each do |hash|
    opportunity = Opportunity.new
    opportunity.title = hash["title"]
    opportunity.organization = hash["org_title"]
    opportunity.address = hash["locality"]
    opportunity.zipcode = hash["postalcode"]
    opportunity.category = hash["category_desc"]
    opportunity.start_date = hash["start_date_date"]
    opportunity.end_date = hash["end_date_date"]
    opportunity.description = hash["summary"]
    opportunity.url = hash["display_url"]
    opportunity.save
  end
end



# {"addresses_count"=>"1",
#   "category_desc"=>"Helping Neighbors in Need",
#   "category_id"=>"2",
#   "content_id"=>"38099",
#   "created_date"=>"February 24 2011",
#   "display_url"=>"/opportunities/5137",
#   "end_date_date"=>"February 24 2012",
#   "event_time"=>"0",
#   "hits"=>"119",
#   "hours"=>"0",
#   "last_modified_date"=>"July 13 2011",
#   "opportunity_id"=>"5137",
#   "org_content_id"=>"3350",
#   "org_title"=>"Institute For Human Identity",
#   "postalcode"=>"10001",
#   "recurrence_type"=>"ongoing",
#   "region"=>"NY",
#   "start_date_date"=>"February 24 2011",
#   "status"=>"approved",
#   "summary"=>
#    "Position entails completing mental health claim forms monthly, tracking payments and interfacing with insurance companies regarding payments, etc.",
#   "title"=>"Health Insurance Claims Manager",
#     "vol_requests"=>"1"},
