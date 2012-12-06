require "./config/boot.rb"
require "rake/testtask"

task default: :test

Rake::TestTask.new do |t|
  t.pattern = "spec/**/*_spec.rb"
end

namespace :db do
  task :migrate do
    Application.migrate_up
  end

  task :drop do
    Application.migrate_down
  end
end

task :import do
  Application.import_from_log
end
