# encoding: utf-8
#
# CAMPO            | DESCRIÇÃO DO CAMPO                                                                      | DESCRIÇÃO TIPO
# LOC_NU           | chave da localidade                                                                     | NUMBER(8)
# UFE_SG           | sigla da UF                                                                             | CHAR(2)
# LOC_NO           | nome da localidade                                                                      | VARCHAR(72)
# CEP              | CEP da localidade (para  localidade  não codificada, ou seja loc_in_sit = 0) (opcional) | CHAR(8)
# LOC_IN_SIT       | situação da localidade:                                                                 | CHAR(1)
#                  | 0 = não codificada em nível de Logradouro                                               |
#                  | 1 = Localidade codificada em nível de Logradouro                                        |
#                  | 2 = Distrito ou Povoado inserido na codificação em nível de Logradouro                  |
# LOC_IN_TIPO_LOC  | tipo de localidade: D – Distrito, M – Município, P – Povoado                            | CHAR(1)
# LOC_NU_SUB       | chave da localidade de subordinação (opcional)                                          | NUMBER(8)
# LOC_NO_ABREV     | abreviatura do nome da localidade (opcional)                                            | VARCHAR(36)
# MUN_NU           | Código do município IBGE (opcional)                                                     | CHAR(7)
# LOC_OPERACAO     | Operação: DEL = Delete, INS  = Insert, UPD = Update                                     | CHAR(3)
# CEP_ANT          | CEP anterior da localidade. Campo informado para LOC_OPERACAO=UPD                       | CHAR(8)

require "csv"

class Localidade
  include CSVModel

  csv_model column_names: %w(loc_nu ufe_sg loc_no cep loc_in_sit loc_in_tipo_loc loc_nu_sub loc_no_abrev mun_nu loc_operacao cep_ant),
            default_file_name: "DELTA_LOG_LOCALIDADE.TXT"
end
