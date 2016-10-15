require_relative 'app'

# use Rack::Static, :urls => ['/css'], :root => 'public' # Rack fix allows seeing the css folder.

run Sinatra::Application
