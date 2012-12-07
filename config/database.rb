# encoding: utf-8

require "data_mapper"
require "dm-migrations/migration_runner"

DataMapper.setup(:default,  "sqlite3:db/database.sqlite3")

DataMapper::Logger.new STDOUT, :debug
DataMapper::Model.raise_on_save_failure = true
DataMapper::Property::String.length(255)

MODEL_CLASSES = [Bairro, GrandeUsuario, Localidade, Logradouro, UnidadeOperacional]

MODEL_CLASSES.each_with_index do |model_class, index|
  table_name = DataMapper::NamingConventions::Resource::UnderscoredAndPluralized.call model_class

  migration index + 1, "create_#{table_name}_table" do
    up do
      create_table table_name do
        column :id, Integer , serial: true
        model_class::COLUMN_NAMES.each{|column_name| column(column_name, String, length: 255)}
      end
    end

    down do
      drop_table table_name
    end
  end
end

migration MODEL_CLASSES.size + 1, :create_table_ceps do
  up do
    create_table :ceps do
      column :cep, String, length: 255
      column :endereco, String, length: 255
      column :bairro, String, length: 255
      column :cidade, String, length: 255
      column :estado, String, length: 255
      column :nome_estado, String, length: 255
    end
  end

  down do
    drop_table :ceps
  end
end
