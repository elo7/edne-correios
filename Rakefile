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

namespace :import do
  task :log do
    Application.import_from_log
  end
  task :delta do
    Application.import_from_delta
  end
end

