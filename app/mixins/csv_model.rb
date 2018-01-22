require "csv"

module CSVModel

  def self.included base
    base.extend ClassMethods
  end

  def merge! model
    fill!(model.to_s.split("@"))
  end

  def fill! row
    self.class.column_names.each_with_index do |name, index|
      public_send "#{name}=", row[index]
    end
  end

  def to_s
    self.class.column_names.collect {|name| public_send name }.join "@"
  end


  module ClassMethods
    def csv_model options={}
      column_names = options.fetch(:column_names)

      define_singleton_method :column_names do
        column_names
      end

      define_singleton_method :delta_file_name do
        options.fetch(:delta_file_name)
      end

      define_singleton_method :log_file_name do
        options.fetch(:log_file_name)
      end

      define_method :operation do
        public_send options.fetch(:operation_attribute)
      end
    end

    def parse file_name
	models = []

	begin
		open(file_name, "r:ISO-8859-1").readlines.each do |line|
			line.encode! "UTF-8"
			line.gsub! "\n", ""
			line.gsub! "\r", ""

			model = new
			model.fill! line.split("@")
			models.push model
		end
	rescue Errno::ENOENT=>e
		puts e.message
	end
	
      models
    end

    def import_from_log
      progress = ProgressLogger.new 100

      parse(log_file_name).each do |model|
        model.save
        progress.log
      end
    end
  end
end

