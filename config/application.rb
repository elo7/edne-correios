require "data_mapper"
require "dm-migrations/migration_runner"

DataMapper.setup(:default,  "sqlite3:db/database.db")
DataMapper::Logger.new STDOUT, :debug
DataMapper::Model.raise_on_save_failure = true

migration 1, :create_bairro_table do
  up do
    create_table :bairros do
      column :id           , Integer , serial: true
      column :bai_nu       , String
      column :ufe_sg       , String
      column :loc_nu       , String
      column :bai_no       , String
      column :bai_no_abrev , String
      column :bai_operacao , String
    end
  end

  down do
    drop_table :bairros
  end
end

class Application
  def self.migrate
    DataMapper.logger.debug "Starting Migration"
    migrate_up!
  end
end

