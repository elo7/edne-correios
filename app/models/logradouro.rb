# encoding: utf-8
#
# LOG_NU          | Chave do logradouro                                              | NUMBER(8)
# UFE_SG          | Sigla da UF                                                      | CHAR(2)
# LOC_NU          | Chave da localidade                                              | NUMBER(8)
# BAI_NU_INI      | Chave do bairro inicial do logradouro                            | NUMBER(8)
# BAI_NU_FIM      | Chave do bairro final do logradouro (opcional)                   | NUMBER(8)
# LOG_NO          | Nome do logradouro                                               | VARCHAR2(100)
# LOG_COMPLEMENTO | Complemento do logradouro (opcional)                             | VARCHAR2(100)
# CEP             | CEP do logradouro                                                | CHAR(8)
# TLO_TX          | Tipo de logradouro                                               | VARCHAR2(36)
# LOG_STA_TLO     | Indicador de utilização do tipo de logradouro (S ou N) (opcional)| CHAR(1)
# LOG_NO_ABREV    | Abreviatura do nome do logradouro (opcional)                     | VARCHAR2(36)
# LOG_OPERACAO    | Operação: DEL, INS, UPD                                          | CHAR(3)
# CEP_ANT         | CEP Anterior do Logradouro. Campo informado para LOG_OPERACAO =UPD.  | CHAR(8)

require "csv"

class Logradouro
  include CSVModel

  csv_model column_names: %w(log_nu ufe_sg loc_nu bai_nu_ini bai_nu_fim log_no log_complemento cep tlo_tx log_sta_tlo log_no_abrev log_operacao cep_ant),
            default_file_name: "DELTA_LOG_LOGRADOURO.TXT"
end
