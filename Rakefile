require 'bundler/setup'

begin
  require 'rspec/core'
  require "rspec/core/rake_task"

  desc "Run all specs in spec directory"

  RSpec::Core::RakeTask.new(:spec)

rescue LoadError
end

task default: :spec
task test:    :spec
