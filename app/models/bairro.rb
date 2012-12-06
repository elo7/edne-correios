# encoding: utf-8
#
# CAMPO        | DESCRIÇÃO DO CAMPO                                  | DESCRIÇÃO TIPO
# BAI_NU       | chave do Bairro                                     | NUMBER(8)
# UFE_SG       | sigla da UF                                         | CHAR(2)
# LOC_NU       | chave da localidade                                 | NUMBER(8)
# BAI_NO       | nome do Bairro                                      | VARCHAR2(72)
# BAI_NO_ABREV | abreviatura do nome do bairro (opcional)            | VARCHAR2(36)
# BAI_OPERACAO | Operação: DEL = Delete, INS  = Insert, UPD = Update | CHAR(3)

class Bairro
  include CSVModel
  include DataMapper::Resource

  COLUMN_NAMES = %w(bai_nu ufe_sg loc_nu bai_no bai_no_abrev bai_operacao)

  csv_model column_names: COLUMN_NAMES,
    default_file_name: "DELTA_LOG_BAIRRO.TXT"

  property :id, Serial
  COLUMN_NAMES.each {|column_name| property(column_name, String, length: 255)}

  def self.import_from_log
    parse("./data/log/LOG_BAIRRO.txt").each do |model|
      begin
        model.save
        print "."
      rescue DataMapper::SaveFailureError => e
        raise model.errors.inspect
      end
    end
  end
end

