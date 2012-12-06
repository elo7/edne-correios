require "./config/database.rb"

class Application
  def self.migrate_up
    migrate_up!
  end

  def self.migrate_down
    migrate_down!
  end

  def self.import_from_log
    MODEL_CLASSES.each do |model_class|
      puts "\n[#{model_class}] importing from log"
      model_class.import_from_log
    end
  end

  def self.import_from_delta
    MODEL_CLASSES.each do |model_class|
      puts "\n[#{model_class}] importing from delta"
      model_class.import_from_delta
    end
  end
end
