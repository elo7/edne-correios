require "./config/database.rb"

class Application
  def self.migrate_up
    migrate_up!
  end

  def self.migrate_down
    migrate_down!
  end

  def self.import_from_log
    MODELS.each do |model|
      puts "\n[#{model}] importing from log"
      model.import_from_log
    end
  end
end
