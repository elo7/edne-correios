# encoding: utf-8

require "./spec/spec_helper"

describe CSVModel do
  class SampleModel
    include CSVModel

    csv_model column_names: %w(bai_nu ufe_sg loc_nu bai_no bai_no_abrev bai_operacao),
      default_file_name: "SAMPLE_MODEL.TXT"
  end

  before do
    @model_csv   = "13370@RS@7953@Loteamento Cidade Universitaria@Lot C Universitaria@DEL"
    @model_array = @model_csv.split "@"
    @model       = SampleModel.new
  end

  describe "#fill" do
    it "fills a bairro" do
      @model.fill! @model_array
      assert_equal @model.to_s, @model_csv
    end
  end

  describe "#parse" do
    it "parses default file" do
      models = SampleModel.parse "./spec/fixtures/sample_model.fixture"
      assert_equal models[0].to_s, "13370@RS@7953@Loteamento Cidade Universitaria@Lot C Universitaria@DEL"
      assert_equal models[1].to_s, "13371@RS@7953@Loteamento Escola Rural@Lot E Rural@DEL"
    end
  end
end
