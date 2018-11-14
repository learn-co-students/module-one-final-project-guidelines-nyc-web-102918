require 'bundler'
require 'rake'
require 'active_record'
require 'yaml/store'
require 'ostruct'
require 'date'
require 'rest-client'
require 'json'
require 'pry'
Bundler.require

Dotenv.load

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'

ActiveRecord::Base.logger = nil
