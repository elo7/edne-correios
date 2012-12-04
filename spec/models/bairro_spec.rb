# encoding: utf-8

require "./spec/spec_helper"

describe Bairro do
  before do
    @bairro_csv   = "13370@RS@7953@Loteamento Cidade Universitaria@Lot C Universitaria@DEL"
    @bairro_array = @bairro_csv.split "@"
    @bairro       = Bairro.new @bairro_array
  end

  describe "#initialize" do
    it "fills a bairro" do
      assert_equal @bairro.to_s, @bairro_csv
    end
  end

  describe "#parse" do
    it "parses default file" do
      bairros = Bairro.parse "./spec/fixtures/bairro.fixture"
      assert_equal bairros[0].to_s, "13370@RS@7953@Loteamento Cidade Universitaria@Lot C Universitaria@DEL"
      assert_equal bairros[1].to_s, "13371@RS@7953@Loteamento Escola Rural@Lot E Rural@DEL"
    end
  end
end
