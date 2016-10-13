require 'active_record'

class Item < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :location
  belongs_to :user

  before_save :downcase_input

  def downcase_input
    self.item_name.downcase!
  end

  after_initialize :defaults, unless: :persisted?

  def defaults
    self.deleted ||= false
    self.quantity ||= 1
  end
end
