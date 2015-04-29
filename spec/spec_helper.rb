ENV['RACK_ENV'] = 'test'
require_relative '../app/server'
require 'database_cleaner'
require 'capybara/rspec'
require 'tilt/erubis'

Capybara.app = App


RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

def sign_in(email = 'm@m.com',
            password = 'password')
  visit '/'
  click_link 'Sign in'
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_button 'Sign in'
end

def sign_up(password_confirmation = 'password',
            email = 'm@m.com',
            password = 'password')
  visit '/'
  click_link 'Sign up'
  fill_in :email, with: email
  fill_in :name, with: 'Mishal'
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end
