require "csv"

module CSVModel

  def self.included base
    base.extend ClassMethods
  end

  def fill! row
    column_names.each_with_index do |name, index|
      public_send "#{name}=", row[index]
    end
  end

  def to_s
    column_names.collect {|name| public_send name }.join "@"
  end

  def insertable?
    operation_attribute == "INS"
  end

  def deletable?
    operation_attribute == "DEL"
  end

  def updatable?
    operation_attribute == "UPD"
  end

  module ClassMethods
    def csv_model options={}
      column_names = options.fetch(:column_names)

      define_method :column_names do
        column_names
      end

      define_method :delta_file_name do
        options.fetch(:delta_file_name)
      end

      define_method :log_file_name do
        options.fetch(:log_file_name)
      end

      define_method :operation_attribute do
        public_send options.fetch(:operation_attribute)
      end
    end

    def parse file_name
      models = []

      open(file_name, "r:ISO-8859-1").readlines.each do |line|
        line.gsub! "\n", ""
        line.gsub! "\r", ""

        model = new
        model.fill! line.split("@")
        models.push model
      end
      models
    end

    def self.import_from_log
      parse(self.log_file_name).each do |model|
        model.save
        print "."
      end
    end
  end
end

