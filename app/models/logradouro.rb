# encoding: utf-8
#
# CAMPO           | DESCRIÇÃO DO CAMPO                                                  | DESCRIÇÃO TIPO
# LOG_NU          | Chave do logradouro                                                 | NUMBER(8)
# UFE_SG          | Sigla da UF                                                         | CHAR(2)
# LOC_NU          | Chave da localidade                                                 | NUMBER(8)
# BAI_NU_INI      | Chave do bairro inicial do logradouro                               | NUMBER(8)
# BAI_NU_FIM      | Chave do bairro final do logradouro (opcional)                      | NUMBER(8)
# LOG_NO          | Nome do logradouro                                                  | VARCHAR2(100)
# LOG_COMPLEMENTO | Complemento do logradouro (opcional)                                | VARCHAR2(100)
# CEP             | CEP do logradouro                                                   | CHAR(8)
# TLO_TX          | Tipo de logradouro                                                  | VARCHAR2(36)
# LOG_STA_TLO     | Indicador de utilização do tipo de logradouro (S ou N) (opcional)   | CHAR(1)
# LOG_NO_ABREV    | Abreviatura do nome do logradouro (opcional)                        | VARCHAR2(36)
# LOG_OPERACAO    | Operação: DEL, INS, UPD                                             | CHAR(3)
# CEP_ANT         | CEP Anterior do Logradouro. Campo informado para LOG_OPERACAO =UPD. | CHAR(8)

class Logradouro
  include CSVModel
  include DataMapper::Resource

  COLUMN_NAMES = %w(log_nu ufe_sg loc_nu bai_nu_ini bai_nu_fim log_no log_complemento cep tlo_tx log_sta_tlo log_no_abrev log_operacao cep_ant)

  csv_model column_names: COLUMN_NAMES,
            default_file_name: "DELTA_LOG_LOGRADOURO.TXT"

  property :id, Serial
  COLUMN_NAMES.each {|column_name| property(column_name, String, length: 255)}

  def self.import_from_log
    %w(AC AL AP AM BA CE DF ES GO MA MT MS MG PA PB PR PE PI RJ RN RS RO RR SC SP SE TO).each do |uf|
      parse("./data/log/LOG_LOGRADOURO_#{uf}.txt").each do |model|
        begin
          model.save
          print "."
        rescue DataMapper::SaveFailureError => e
          raise model.errors.inspect
        end
      end
    end
  end
end
