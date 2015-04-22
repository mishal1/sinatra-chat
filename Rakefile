require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RSpec::Core::RakeTask.new :spec

RuboCop::RakeTask.new(:cop) do |task|
  task.fail_on_error = false
end

task default: [:spec]
