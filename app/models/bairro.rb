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

  csv_model column_names: %w(bai_nu ufe_sg loc_nu bai_no bai_no_abrev bai_operacao),
    default_file_name: "DELTA_LOG_BAIRRO.TXT"

  property :id           , Serial
  property :bai_nu       , String
  property :ufe_sg       , String
  property :loc_nu       , String
  property :bai_no       , String
  property :bai_no_abrev , String
  property :bai_operacao , String
end

