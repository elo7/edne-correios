require "minitest/spec"
require "minitest/autorun"
require "./config/boot"

def self.it_behaves_like_csv_model model_class, column_names, log_file_name, delta_file_name
  describe model_class do
    before do
      @model = model_class.new
    end

    it "should define column names" do
      assert_equal model_class.column_names, column_names
    end

    it "should define delta file name" do
      assert_equal model_class.delta_file_name, delta_file_name
    end

    it "should define log file name" do
      assert_equal model_class.log_file_name, log_file_name
    end
  end
end

