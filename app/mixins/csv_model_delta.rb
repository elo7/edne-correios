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
      parse(delta_file_name).each do |model|
        if model.insertable?
          model.save
          print "I"
        elsif model.deletable?
          model.class.find_same(model).destroy
          print "D"
        elsif model.updatable?
          model_to_update = model.class.find_same(model).first
          model_to_update.fill! model.to_s
          model_to_update.save
          print "U"
        end
        print "."
      end
    end
  end
end

