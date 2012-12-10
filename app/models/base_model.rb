class BaseModel
  include CSVModel
  include CSVModelDelta
  include DataMapper::Resource

  def self.model options={}
    csv_model options

    define_singleton_method :column_names do
      options.fetch(:column_names)
    end

    create_properties options.fetch(:column_names).clone

    storage_names[:default] = DataMapper::NamingConventions::Resource::UnderscoredAndPluralized.call(self)
  end

  def self.create_properties column_names
    first_column = column_names.shift

    define_method :find_same do
      self.class.all(first_column.to_sym => public_send(first_column)).first
    end

    property first_column, String, length: 255, key: true
    column_names.each do |column_name|
      property column_name, String, length: 255
    end
  end
end
