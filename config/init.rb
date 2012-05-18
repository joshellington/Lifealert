# require 'newrelic_rpm'
require 'open-uri'
require 'json'
require 'date'
require 'time'
require 'pp'
require 'mongo_mapper'

require './app/models/site'

MongoMapper.connection = Mongo::Connection.new('dbh45.mongolab.com', 27457, :pool_size => 5)
MongoMapper.database = 'lifealert'
MongoMapper.database.authenticate('life','alert')

def base_uri
  base_uri_raw = request.env["HTTP_HOST"]+request.env["SCRIPT_NAME"]
  path = URI.parse(request.env["REQUEST_URI"]).path
  base_uri = "http://"+base_uri_raw.split(path)[0]
end

def curr_path
  base_uri_raw = request.env["HTTP_REFERER"]
end

def match(path, opts={}, &block)
  get(path, opts, &block)
  post(path, opts, &block)
end