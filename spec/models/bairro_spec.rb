# encoding: utf-8

require "./spec/spec_helper"

it_behaves_like_csv_model Bairro,
  %w(bai_nu ufe_sg loc_nu bai_no bai_no_abrev bai_operacao),
  "DELTA_LOG_BAIRRO.TXT"

