# frozen_string_literal: true
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.verbose = true
end

RuboCop::RakeTask.new(:lint) do |t|
  t.patterns = ['lib']
end
