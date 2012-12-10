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

class GrandeUsuario < BaseModel

  model column_names:        %w(gru_nu ufe_sg loc_nu bai_nu log_nu gru_no gru_endereco cep gru_no_abrev gru_operacao cep_ant),
        log_file_name:       "./data/log/LOG_GRANDE_USUARIO.TXT",
        delta_file_name:     "./data/delta/DELTA_LOG_GRANDE_USUARIO.TXT",
        operation_attribute: :gru_operacao

end
