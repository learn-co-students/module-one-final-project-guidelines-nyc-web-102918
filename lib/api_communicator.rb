require 'rest-client'
require 'json'
require 'pry'

COMPLAINTS = "https://data.cityofnewyork.us/resource/fhrw-4uyv.json"

def request(url)
  response_string = RestClient.get(url)
  response_hash = JSON.parse(response_string)
  response_hash
end
