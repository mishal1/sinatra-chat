env = ENV['RACK_ENV'] || 'development'
DataMapper.setup(:default, "postgres://localhost/twitter_#{env}")
require_relative './models/user.rb'
DataMapper.finalize
DataMapper.auto_upgrade!