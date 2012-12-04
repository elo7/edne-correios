# encoding: utf-8

require "./spec_helper"

describe Bairro do
  subject(:bairro) { Bairro.new }

  it_should_behave_like CorreiosCSVParseable, Bairro.new, 2

  describe "#parse" do
    it "parses bairros fixture correctly and assings attributes properly" do
      bairros = Bairro.parse "./spec/fixtures/Bairro.fixture"

      first_bairro = bairros.first

      expect(first_bairro.bai_nu).to eq "13370"
      expect(first_bairro.ufe_sg).to eq "RS"
      expect(first_bairro.loc_nu).to eq "7953"
      expect(first_bairro.bai_no).to eq "Loteamento Cidade Universitaria"
      expect(first_bairro.bai_no_abrev).to eq "Lot C Universitaria"
      expect(first_bairro.bai_operacao).to eq "DEL"

      second_bairro = bairros.last

      expect(second_bairro.bai_nu).to eq "13371"
      expect(second_bairro.ufe_sg).to eq "RS"
      expect(second_bairro.loc_nu).to eq "7953"
      expect(second_bairro.bai_no).to eq "Loteamento Escola Rural"
      expect(second_bairro.bai_no_abrev).to eq "Lot E Rural"
      expect(second_bairro.bai_operacao).to eq "DEL"

    end
  end
end
