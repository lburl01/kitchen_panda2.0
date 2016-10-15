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

register Sinatra::CrossOrigin

set :views, Proc.new { File.open("app/views/") }

configure do
  enable :cross_origin
end

options '/*' do
  response["Access-Control-Allow-Headers"] = "origin, x-requested-with, content-type"
end

configure do
  enable :sessions unless test?
  set :session_secret, "secret"
end

get '/' do
  slim :home
end

get '/registrations/signup' do
  slim :'registrations/signup'
end

get '/sessions/login' do
  slim :'sessions/login'
end

get '/sessions/logout' do
  session.clear
  redirect '/'
end

get '/users/home' do
  @user = User.find(session[:id])
  slim :'/users/home'
end

get '/users/pantry' do
  @user = User.find(session[:id])
  slim :'/users/pantry'
end

get '/users/freezer' do
  @user = User.find(session[:id])
  slim :'/users/freezer'
end

get '/users/fridge' do
  @user = User.find(session[:id])
  slim :'/users/fridge'
end

post '/registrations' do
  @user = User.new(name: params[:name], password: params[:password])
  @user.save if @user.valid?
  status 201
  session[:id] = @user.id
  redirect '/users/home'
  content_type :json
  return @user.to_json
end

post '/sessions' do
  @user = User.find_by(name: params[:name], password: params[:password])
  session[:id] = @user.id
  redirect '/users/home'
  content_type :json
  return @user.to_json
end
