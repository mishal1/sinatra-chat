require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'data_mapper'
require './app/datamapper_setup'

RSpec::Core::RakeTask.new :spec

RuboCop::RakeTask.new(:cop) do |task|
  task.fail_on_error = false
end

task default: [:spec, :cop]

task test: [:spec]

task :auto_upgrade do
  DataMapper.auto_upgrade!
  puts 'Auto-upgrade complete (no data loss)'
end

task :auto_migrate do
  DataMapper.auto_migrate!
  puts 'Auto-migrate complete (data could have been lost)'
end
