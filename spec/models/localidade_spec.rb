# encoding: utf-8

require "./spec/spec_helper"

describe Localidade do
  before do
    @localidade_csv   = "6389@PR@Nova Santa Helena@87564000@0@D@6175@Nova Sta Helena@       @UPD@87564000"
    @localidade_array = @localidade_csv.split "@"
    @localidade       = Localidade.new
  end

  describe "#initialize" do
    it "fills a localidade" do
      @localidade.fill! @localidade_array
      assert_equal @localidade.to_s, @localidade_csv
    end
  end

  describe "#parse" do
    it "parses default file" do
      localidades = Localidade.parse "./spec/fixtures/localidade.fixture"
      assert_equal localidades[0].to_s, "6389@PR@Nova Santa Helena@87564000@0@D@6175@Nova Sta Helena@       @UPD@87564000"
      assert_equal localidades[1].to_s, "1487@CE@Nova Santa Cruz@63218000@0@D@1500@Nova Sta Cruz@       @UPD@63218000"
    end
  end
end
