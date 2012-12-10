module CSVModelDelta

  def self.included base
    base.extend ClassMethods
  end

  def insertable?
    operation == "INS"
  end

  def deletable?
    operation == "DEL"
  end

  def updatable?
    operation == "UPD"
  end

  module ClassMethods
    def import_from_delta
      progress = ProgressLogger.new 100

      parse(delta_file_name).each do |model|
        if model.insertable?
          model.save

        elsif model.deletable?
          model.find_same.destroy

        elsif model.updatable?
          model_to_update = model.find_same
          model_to_update.fill! model.to_s
          model_to_update.save
        end

        progress.log
      end
    end
  end
end

