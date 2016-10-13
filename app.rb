require 'sinatra'
require 'yaml'
require_relative 'app/models/item'
require_relative 'app/models/location'
require_relative 'app/models/user'
require 'json'
require "sinatra/cross_origin"

before do
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
end

after do
  ActiveRecord::Base.connection.close
end

register Sinatra::CrossOrigin

configure do
  enable :cross_origin
end

options '/*' do
  response["Access-Control-Allow-Headers"] = "origin, x-requested-with, content-type"
end

get '/' do
  erb :index
end
