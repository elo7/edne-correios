require "minitest/spec"
require "minitest/autorun"
require "./config/boot"

def self.it_behaves_like_csv_model model_class, column_names, default_file_name
  describe model_class do
    before do
      @model = model_class.new
    end

    it "should define column names" do
      assert_equal @model.column_names, column_names
    end

    it "should define default file name" do
      assert_equal @model.default_file_name, default_file_name
    end
  end
end

