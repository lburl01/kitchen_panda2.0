# require 'sinatra'
# require 'yaml'
# require_relative '../models/item'
# require_relative '../models/location'
# require_relative '../models/user'
# require 'json'
# require "sinatra/cross_origin"
# require 'sinatra/activerecord'
#
# class ApplicationController < Sinatra::Base
#   register Sinatra::ActiveRecordExtension
#   set :views, Proc.new { File.open("../views/") }
#
#   register Sinatra::CrossOrigin
#
#   configure do
#     enable :cross_origin
#   end
#
#   options '/*' do
#     response["Access-Control-Allow-Headers"] = "origin, x-requested-with, content-type"
#   end
#
#   get '/' do
#     erb :home
#   end
