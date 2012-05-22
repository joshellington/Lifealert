require 'open-uri'
require 'time'

def check url
  io = open(url)
  io.status
end

namespace :check do
  desc "Check sites"
  task :all => :environment do
    all = Site.all

    all.each do |site|
      res = check(site.url)
      puts res.inspect
      res.inspect
    end
  end
end