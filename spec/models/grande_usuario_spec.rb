# encoding: utf-8

require "./spec/spec_helper"

it_behaves_like_csv_model GrandeUsuario,
  %w(gru_nu ufe_sg loc_nu bai_nu log_nu gru_no gru_endereco cep gru_no_abrev gru_operacao cep_ant),
  "DELTA_LOG_GRANDE_USUARIO.TXT"
