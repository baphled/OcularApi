$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rspec'
require "pry"
require 'rack/test'

require 'ocular_api'

ENV['RACK_ENV'] = 'test'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/../lib/**/*.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

Ocular::Config.config do |c|
  c.login = 'username'
  c.password = 'password'
  c.repository = 'account/repository'
end

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end
