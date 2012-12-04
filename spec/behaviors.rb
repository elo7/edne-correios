shared_examples_for CorreiosCSVParseable do |correios_csv_parseable, number_of_rows|
  it "should be insertable" do
    correios_csv_parseable.should_receive(:operation).and_return("INS")
    expect(correios_csv_parseable.insertable?).to be_true
  end

  it "should be updatable" do
    correios_csv_parseable.should_receive(:operation).and_return("UPD")
    expect(correios_csv_parseable.updatable?).to be_true
  end

  it "should be deletable" do
    correios_csv_parseable.should_receive(:operation).and_return("DEL")
    expect(correios_csv_parseable.deletable?).to be_true
  end

  describe "#parse" do
    it "parses #{correios_csv_parseable.class} fixture" do
      bairros = correios_csv_parseable.class.parse "./spec/fixtures/#{correios_csv_parseable.class.name}.fixture"
      expect(bairros.size).to eq number_of_rows
    end
  end
end
