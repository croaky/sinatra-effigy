require 'rubygems'
require 'sinatra/base'
require 'spec'
require 'rack/test'
require File.join(File.dirname(__FILE__), '..', 'lib', 'sinatra', 'effigy')

Spec::Runner.configure do |config|
  config.include Rack::Test::Methods
end
