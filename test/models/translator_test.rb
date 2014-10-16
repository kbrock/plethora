require "test_helper"

describe Translator do
  subject { described_class }
  it "doesnt translate noun to noun" do
    assert_equal "multitude", Translator.translate("noun","noun", "multitude")
  end

  it "translate noun to adj" do
    assert_equal "a multitude of", Translator.translate("noun","adj", "multitude")
  end
end
