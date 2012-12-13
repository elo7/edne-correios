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

  private
  def self.create_properties column_names
    correios_pk = column_names.shift

    define_method :find_same do
      self.class.all(correios_pk.to_sym => public_send(correios_pk)).first
    end

    property correios_pk, String, length: 255, key: true
    column_names.each do |column_name|
      property column_name, String, length: 255
    end
  end
end
