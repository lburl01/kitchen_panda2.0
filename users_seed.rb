require_relative 'app/models/user'
require_relative 'db/migrate/001_create_users'

def main
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])

  lori = User.create!(name: "lori", password: "password")

  peter = User.create!(name: "peter", password: "anotherpassword")

  ellis = User.create!(name: "ellis", password: "12345")

  miles = User.create!(name: "miles", password: "password!")

  ActiveRecord::Base.connection.close
end

main if __FILE__ == $PROGRAM_NAME
