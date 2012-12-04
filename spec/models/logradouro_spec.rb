# encoding: utf-8

require "./spec/spec_helper"

describe Logradouro do
  before do
    @logradouro_csv   = "845193@AM@243@54727@@Amelia Rates@@69058295@Rua@S@R Amelia Rates@UPD@69058295"
    @logradouro_array = @logradouro_csv.split "@"
    @logradouro       = Logradouro.new
  end

  describe "#fill" do
    it "fills a logradouro" do
      @logradouro.fill! @logradouro_array
      assert_equal @logradouro.to_s, @logradouro_csv
    end
  end

  describe "#parse" do
    it "parses default file" do
      logradouros = Logradouro.parse "./spec/fixtures/logradouro.fixture"
      assert_equal logradouros[0].to_s, "845193@AM@243@54727@@Amelia Rates@@69058295@Rua@S@R Amelia Rates@UPD@69058295"
      assert_equal logradouros[1].to_s, "9690@AM@243@162@@Sete Quedas@@69080500@Rua@S@R Sete Quedas@UPD@69080500"
    end
  end
end
