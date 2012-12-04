
module CorreiosCSVParseable

  def self.included(base)
    def base.default_filename filename
      @@default_filename = filename
    end

    def base.parse filename
      filename ||= @@default_filename

      model_list = []
      CSV.foreach(filename, col_sep: "@", encoding: "ISO-8859-1") do |row|
        model = self.new
        model.fill! row
        model_list << model
      end
      model_list
    end

    def base.attr_csv_parseable *attr_symbols
      attr_accessor *attr_symbols
      @@attr_symbols = attr_symbols
      @@operation_attr = attr_symbols.last
    end
  end

  def fill! row
    @@attr_symbols.each_index do |index|
      public_send "#{@@attr_symbols[index]}=", row[index]
    end
  end

  def operation
    self.public_send @@operation_attr
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
end
