require 'rubygems'
require 'sinatra'
require './config/init'

#
# Before any route is run
before do
  @path = request.env['SCRIPT_NAME']
end

#
# Routes
match '/' do
  @all = Site.all

  erb :index
end

post '/new/?' do
  s = Site.new(:url => params[:url], :email => params[:email])
  s.save!

  "success"
end

get '/delete/:id/?' do
  s = Site.find_by_id(params[:id])
  if s
    s.destroy
  end

  "success"
end