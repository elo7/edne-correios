# encoding: utf-8

require "./spec/spec_helper"

it_behaves_like_csv_model UnidadeOperacional,
  %w(uop_nu ufe_sg loc_nu bai_nu log_nu uop_no uop_endereco cep uop_in_cp uop_no_abrev uop_operacao cep_ant),
  "DELTA_LOG_UNID_OPER.TXT"
