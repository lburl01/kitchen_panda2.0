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

get '/items' do
  content_type :json
  @items = Item.where(user_id: session[:id]).all.to_json
end

get '/users/pantry' do
  @items = Item.select(:name, :quantity, :location_id).joins("INNER JOIN users on items.user_id = users.id").where(user_id: session[:id]).where(location_id: 3).all
  slim :'/users/pantry'
end

get '/users/freezer' do
  @items = Item.select(:name, :quantity, :location_id).joins("INNER JOIN users on items.user_id = users.id").where(user_id: session[:id]).where(location_id: 1).all
  slim :'/users/freezer'
end

get '/users/fridge' do
  @items = Item.select(:name, :quantity, :location_id).joins("INNER JOIN users on items.user_id = users.id").where(user_id: session[:id]).where(location_id: 2).all
  slim :'/users/fridge'
end

get '/users/search' do
  @items = Item.select("items.name, quantity, location_id, locations.name as location_name").joins("INNER JOIN users on items.user_id = users.id").joins("INNER JOIN locations on items.location_id = locations.id").where(user_id: session[:id]).where("items.name like (?)", "%#{params['search']}%").where(is_deleted: false).all
  slim :'users/search'
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

post '/users/home' do
  @item = Item.new(user_id: session[:id], location_id: params[:location_id], name: params['name'], quantity: params['quantity'])
  @item.save if @item.valid?
  status 201
  content_type :json
  return @item.to_json
end

put '/items/remove/:id' do |id|
  @item = Item.find_by_id(id)
  unless @item.nil?
    @item.update(is_deleted: true)
  end
end
