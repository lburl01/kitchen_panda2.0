require 'active_record'

class User < ActiveRecord::Base
  validates :name, :password, presence: true

  has_many :items
  has_many :locations, through: :items

end
