require 'rubygems'
require './config/init'

def check url
  io = open(url)
  io.status
end

all = Site.all

all.each do |site|
  res = check(site.url)
  pp res
end