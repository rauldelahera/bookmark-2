
# Set the environment to "test"
ENV['RACK_ENV'] = 'test'

# Bring in the contents of the `app.rb` file. The below is equivalent to: require_relative '../app.rb'
require File.join(File.dirname(__FILE__), '..', 'app.rb')

# Require all the testing gems
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'pg'
require_relative './setup_test_database'
require 'database_helpers'

# Tell Capybara to talk to BookmarkManager
Capybara.app = BookmarkManager

# RSpec.configure do |config|
#   config.expect_with :rspec do |expectations|
#     expectations.include_chain_clauses_in_custom_matcher_descriptions = true
#   end

#   config.mock_with :rspec do |mocks|
#     mocks.verify_partial_doubles = true
#   end

#   config.shared_context_metadata_behavior = :apply_to_host_groups
# end

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end


