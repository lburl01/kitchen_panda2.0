require_relative 'app/models/item'
require_relative 'db/migrate/002_create_locations'

def main
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])

  freezer = Location.create!(name: 'freezer')

  refrigerator = Location.create!(name: 'fridge')

  pantry = Location.create!(name: 'pantry')

  ActiveRecord::Base.connection.close
end

main if __FILE__ == $PROGRAM_NAME
