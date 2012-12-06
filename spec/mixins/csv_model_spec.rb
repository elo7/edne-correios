# encoding: utf-8

require "./spec/spec_helper"

describe CSVModel do
  class SampleModel
    include CSVModel

    attr_accessor :bai_nu, :ufe_sg, :loc_nu, :bai_no, :bai_no_abrev, :bai_operacao

    csv_model column_names: %w(bai_nu ufe_sg loc_nu bai_no bai_no_abrev bai_operacao),
      default_file_name: "SAMPLE_MODEL.TXT", operation_attribute: :bai_operacao
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

  describe "#insertable?" do
    it "should be insertable" do
      @model.fill! "13370@RS@7953@Loteamento Cidade Universitaria@Lot C Universitaria@INS".split "@"
      assert @model.insertable?
    end

    it "should not be insertable" do
      @model.fill! "13370@RS@7953@Loteamento Cidade Universitaria@Lot C Universitaria@".split "@"
      assert (not @model.insertable?)
    end

    it "should not be insertable" do
      @model.fill! "13370@RS@7953@Loteamento Cidade Universitaria@Lot C Universitaria@UPD"
      assert (not @model.insertable?)
    end
  end

  describe "#updatable?" do
    it "should be updatable" do
      @model.fill! "13370@RS@7953@Loteamento Cidade Universitaria@Lot C Universitaria@UPD".split "@"
      assert @model.updatable?
    end

    it "should not be updatable" do
      @model.fill! "13370@RS@7953@Loteamento Cidade Universitaria@Lot C Universitaria@".split "@"
      assert (not @model.updatable?)
    end

    it "should not be updatable" do
      @model.fill! "13370@RS@7953@Loteamento Cidade Universitaria@Lot C Universitaria@DEL"
      assert (not @model.updatable?)
    end
  end

  describe "#deletable?" do
    it "should be deletable" do
      @model.fill! "13370@RS@7953@Loteamento Cidade Universitaria@Lot C Universitaria@DEL".split "@"
      assert @model.deletable?
    end

    it "should not be deletable" do
      @model.fill! "13370@RS@7953@Loteamento Cidade Universitaria@Lot C Universitaria@".split "@"
      assert (not @model.deletable?)
    end

    it "should not be deletable" do
      @model.fill! "13370@RS@7953@Loteamento Cidade Universitaria@Lot C Universitaria@INS"
      assert (not @model.deletable?)
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

