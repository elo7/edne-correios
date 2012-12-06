# encoding: utf-8

require "./spec/spec_helper"

it_behaves_like_csv_model Logradouro,
  %w(log_nu ufe_sg loc_nu bai_nu_ini bai_nu_fim log_no log_complemento cep tlo_tx log_sta_tlo log_no_abrev log_operacao cep_ant),
  nil,
  "./data/delta/DELTA_LOG_LOGRADOURO.TXT"

