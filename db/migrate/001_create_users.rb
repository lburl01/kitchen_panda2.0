require 'active_record'

class CreateUsers < ActiveRecord::Migration[5.0]
  def up
    create_table :users do |t|
      t.string :name
      t.string :password
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
