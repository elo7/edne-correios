# encoding: utf-8

require "./spec/spec_helper"

it_behaves_like_csv_model Localidade,
  %w(loc_nu ufe_sg loc_no cep loc_in_sit loc_in_tipo_loc loc_nu_sub loc_no_abrev mun_nu loc_operacao cep_ant),
  "DELTA_LOG_LOCALIDADE.TXT"

