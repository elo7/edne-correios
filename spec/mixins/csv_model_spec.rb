# encoding: utf-8

require "./spec/spec_helper"

describe CSVModel do
  class SampleModel
    include CSVModel

    attr_accessor :bai_nu, :ufe_sg, :loc_nu, :bai_no, :bai_no_abrev, :bai_operacao

    csv_model column_names:  %w(bai_nu ufe_sg loc_nu bai_no bai_no_abrev bai_operacao),
      log_file_name:         "./spec/fixtures/log/SAMPLE.TXT",
      delta_file_name:       "./spec/fixtures/delta/SAMPLE.TXT",
      operation_attribute:   :bai_operacao
  end

  before do
    @model_csv   = "13370@RS@7953@Loteamento Cidade Universitaria@Lot C Universitaria@DEL"
    @model_array = @model_csv.split "@"
    @model       = SampleModel.new
  end

  describe "#fill" do
    it "fills a bairro" do
      @model.fill! @model_array
      assert_equal @model_csv, @model.to_s
    end
  end

  describe "#parse" do
    it "parses default file" do
      models = SampleModel.parse "./spec/fixtures/sample_model.fixture"
      assert_equal models[0].to_s, "13370@RS@7953@Loteamento Cidade Universitaria@Lot C Universitaria@DEL"
      assert_equal models[1].to_s, "13371@RS@7953@Loteamento Escola Rural@Lot E Rural@DEL"
    end
  end

  describe "#operation" do
    it "should be DEL" do
      @model.fill! "13370@RS@7953@Loteamento Cidade Universitaria@Lot C Universitaria@DEL".split "@"
      assert_equal "DEL", @model.operation
    end

    it "should be INS" do
      @model.fill! "13370@rs@7953@loteamento cidade universitaria@lot c universitaria@INS".split "@"
      assert_equal "INS", @model.operation
    end

    it "should be UPD" do
      @model.fill! "13370@rs@7953@loteamento cidade universitaria@lot c universitaria@UPD".split "@"
      assert_equal "UPD", @model.operation
    end
  end
end

