require 'rubygems'
require 'bundler/setup'
require 'active_record'
require 'pg'
require 'yaml'

namespace :db do

  desc "Migrate the db"
  task :migrate do
    connection_details = YAML::load(File.open('config/database.yml'))
    ActiveRecord::Base.establish_connection(ENV['DATABASE_URL']) 
    ActiveRecord::Migrator.migrate("db/migrate/")
  end

  desc "Create the db"
  task :create do
    connection_details = YAML::load(File.open('config/database.yml'))
    ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
    ActiveRecord::Base.connection.create_database(connection_details.fetch('database'))
  end

  desc "drop the db"
  task :drop do
    connection_details = YAML::load(File.open('config/database.yml'))
    ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
    ActiveRecord::Base.connection.drop_database(connection_details.fetch('database'))
  end
end
