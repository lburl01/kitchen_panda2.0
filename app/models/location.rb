require 'active_record'

class Location < ActiveRecord::Base
  has_many :items
  has_many :users, through: :items
end
