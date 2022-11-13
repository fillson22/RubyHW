require_relative './app/my_app'
require 'rack'

use Rack::Reloader
use Rack::Auth::Basic do |username, password|
  username == 'user' && password == 'user'
end

run MyApp.new