# encoding: utf-8
#
# CAMPO        | DESCRIÇÃO DO CAMPO                                                           | DESCRIÇÃO TIPO
# UOP_NU       | chave da UOP                                                                 | NUMBER(8)
# UFE_SG       | sigla da UF                                                                  | CHAR(2)
# LOC_NU       | chave da localidade                                                          | NUMBER(8)
# BAI_NU       | chave do bairro                                                              | NUMBER(8)
# LOG_NU       | chave do logradouro (opcional)                                               | NUMBER(8)
# UOP_NO       | nome da UOP                                                                  | VARCHAR2(100)
# UOP_ENDERECO | endereço da UOP                                                              | VARCHAR2(100)
# CEP          | CEP da UOP                                                                   | CHAR(8)
# UOP_IN_CP    | indicador de caixa postal (S ou N)                                           | CHAR(1)
# UOP_NO_ABREV | abreviatura do nome da unid. operacional (opcional)                          | VARCHAR2(36)
# UOP_OPERACAO | Operação: DEL, INS, UPD                                                      | CHAR(3)
# CEP_ANT      | CEP anterior da Unidade Operacional. Campo informado para UOP_OPERACAO =UPD. | CHAR(8)

class UnidadeOperacional
  include CSVModel
  include DataMapper::Resource

  COLUMN_NAMES = %w(uop_nu ufe_sg loc_nu bai_nu log_nu uop_no uop_endereco cep uop_in_cp uop_no_abrev uop_operacao cep_ant)

  csv_model column_names: COLUMN_NAMES,
    log_file_name: "./data/log/LOG_UNID_OPER.TXT",
    delta_file_name: "./data/delta/DELTA_LOG_UNID_OPER.TXT"

  property :id, Serial
  COLUMN_NAMES.each {|column_name| property(column_name, String, length: 255)}
end

