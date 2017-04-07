ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'capybara/poltergeist'
require 'database_cleaner'

# attempted fix for failing test http://atlwendy.ghost.io/capybara-database-locked/
# DatabaseCleaner.strategy = :truncation
# class ActiveRecord::Base
#   mattr_accessor :shared_connection
#   @@shared_connection = nil
#
#   def self.connection
#     @@shared_connection || retrieve_connection
#   end
# end
#
# ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include Capybara::DSL
  Capybara.javascript_driver = :poltergeist
  DatabaseCleaner.strategy = :transaction
  # Add more helper methods to be used by all tests here...

  def teardown
    Capybara.use_default_driver
    DatabaseCleaner.clean
  end
end
