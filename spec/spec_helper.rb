ENV['RACK_ENV'] = 'test'
require_relative '../app/server'
require 'database_cleaner'
require 'capybara/rspec'
require 'tilt/erubis'

Capybara.app = App

RSpec.configure do |config|

  config.before(:each) do
    if Capybara.current_driver == :rack_test
      DatabaseCleaner.strategy = :transaction
    else
      puts Capybara.current_driver
      DatabaseCleaner.strategy = :truncation
    end
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
