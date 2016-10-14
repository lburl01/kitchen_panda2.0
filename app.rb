require 'sinatra'
require 'yaml'
require_relative 'app/models/item'
require_relative 'app/models/location'
require_relative 'app/models/user'
require 'json'
require "sinatra/cross_origin"
require 'slim'

before do
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
end

after do
  ActiveRecord::Base.connection.close
end

register Sinatra::CrossOrigin

set :views, Proc.new { File.open("app/views/") }

configure do
  enable :cross_origin
end

options '/*' do
  response["Access-Control-Allow-Headers"] = "origin, x-requested-with, content-type"
end

get '/' do
  slim :home
end

get '/registrations/signup' do
  erb :'registrations/signup'
end

get '/sessions/login' do
  erb :'registrations/signup'
end

get '/users/home' do
  erb :'users/home'
end
