# config.ru

require 'rubygems'
require 'sinatra'

require File.dirname(__FILE__) + "/app/app.rb"

run Sinatra::Application
