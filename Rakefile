require "./config/boot.rb"
require "rake/testtask"

task default: :test

Rake::TestTask.new do |t|
  t.pattern = "spec/**/*_spec.rb"
end

namespace :db do
  task :migrate do
    Application.migrate
  end
end
