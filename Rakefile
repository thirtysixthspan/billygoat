require 'rspec/core/rake_task'
require 'bundler/gem_tasks'

RSpec::Core::RakeTask.new(:spec)
task :default => :spec

task :build_documentation do
  `bundle exec goat document > COMMANDS.md`
end