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
        # if model.insertable?
        # model.save
        # elsif model.deletable?
        # model.class.where("").delete
        # elsif model.updatable?
        # model2 = model.class.where("").delete
        # model2.fill! model.to_s
        # model2.save
        # end
        # print "."
      end
    end
  end
end

