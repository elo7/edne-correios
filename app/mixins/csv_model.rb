module CSVModel

  def self.included base
    base.extend ClassMethods
  end

  def initialize row
    fill! row
  end

  def fill! row
    column_names.each_with_index do |name, index|
      public_send "#{name}=", row[index]
    end
  end

  def to_s
    column_names.collect {|name| public_send name }.join "@"
  end

  module ClassMethods

    def csv_model options={}
      column_names = options.fetch(:column_names)
      define_method :column_names do
        column_names
      end
      column_names.each {|name| attr_accessor name}
      define_method :default_file_name do 
        options.fetch(:default_file_name)
      end
    end

    def parse file_name=self.default_file_name
      models = []
      CSV.foreach(file_name, col_sep: "@", encoding: "ISO-8859-1") do |row|
        model = new row
        model.fill!
        models.push model
      end
      models
    end
  end
end

