require_relative 'app/models/item'
require_relative 'db/migrate/003_create_items'

def main
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])

  pineapple = Item.create!(user_id: 1, location_id: 2, name: "pineapple", quantity: 2, is_deleted: false)

  barbecue = Item.create!(user_id: 2, location_id: 2, name: "barbecue", quantity: 1, is_deleted: false)

  pizza = Item.create!(user_id: 3, location_id: 2, name: "pizza", quantity: 1, is_deleted: false)

  flour = Item.create!(user_id: 4, location_id: 3, name: "flour", quantity: 4, is_deleted: false)

  milk = Item.create!(user_id: 1, location_id: 2, name: "milk", quantity: 3, is_deleted: false)

  ice_cream = Item.create!(user_id: 2, location_id: 1, name: "ice cream", quantity: 1, is_deleted: false)

  ActiveRecord::Base.connection.close
end

main if __FILE__ == $PROGRAM_NAME
