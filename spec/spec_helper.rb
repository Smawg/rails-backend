ENV["RAILS_ENV"] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

require 'factory_girl_rails'

Dir[Rails.root.join('spec/support/**/*.rb')].each {|f| require f}

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include ApiHelper, :type => :api
  config.include Request::JsonHelpers
  config.infer_spec_type_from_file_location!
end
