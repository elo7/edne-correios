# encoding: utf-8
#
# CAMPO        | DESCRIÇÃO DO CAMPO                                                     | DESCRIÇÃO TIPO
# GRU_NU       | chave do grande usuário                                                | NUMBER(8)
# UFE_SG       | sigla da UF                                                            | CHAR(2)
# LOC_NU       | chave da localidade                                                    | NUMBER(8)
# BAI_NU       | chave do bairro                                                        | NUMBER(8)
# LOG_NU       | chave do logradouro (opcional)                                         | NUMBER(8)
# GRU_NO       | nome do grande usuário                                                 | VARCHAR2(72)
# GRU_ENDERECO | endereço do grande usuário                                             | VARCHAR2(100)
# CEP          | CEP                                                                    | do grande usuário | CHAR(8)
# GRU_NO_ABREV | abreviatura do nome do grande usuário (opcional)                       | VARCHAR2(36)
# GRU_OPERACAO | Operação: DEL, INS, UPD                                                | CHAR(3)
# CEP_ANT      | CEP anterior do Grande Usuário. Campo informado para GRU_OPERACAO =UPD | CHAR(8)

class GrandeUsuario
  include CSVModel
  include DataMapper::Resource

  COLUMN_NAMES = %w(gru_nu ufe_sg loc_nu bai_nu log_nu gru_no gru_endereco cep gru_no_abrev gru_operacao cep_ant)

  csv_model column_names: COLUMN_NAMES,
            default_file_name: "DELTA_LOG_GRANDE_USUARIO.TXT"

  property :id, Serial
  COLUMN_NAMES.each {|column_name| property(column_name, String, length: 255)}

  def self.import_from_log
    parse("./data/log/LOG_GRANDE_USUARIO.txt").each do |model|
      begin
        model.save
        print "."
      rescue DataMapper::SaveFailureError => e
        raise model.errors.inspect
      end
    end
  end
end
