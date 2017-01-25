require 'sinatra/base'
require './lib/lumberjack'

class Server < Sinatra::Base
  include Lumberjack

  use Rack::Auth::Basic do |username, password|
    username == ENV['API_USER'] && password == ENV['API_PASSWORD']
  end

  get '/' do
    'WOOOOOOO'
  end
end
