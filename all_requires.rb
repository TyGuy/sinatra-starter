require 'pry'
require './server'
require './config/dotenv'
require './config/environments'

def require_dir(dir)
  Dir[File.join(__dir__, dir, '*.rb')].each { |file| require file.gsub(/.rb$/, '') }
end

# require all files in lib, models
require_dir('lib')
require_dir('models')
