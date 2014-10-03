require 'test_helper'

describe Word do
  it "strips text" do
    subject = Word.new(text: "  WOrd  ").tap { |s| s.valid? }
    assert_equal "word", subject.text
  end

  it "strips root" do
    subject = Word.new(root: "  WOrd  ").tap { |s| s.valid? }
    assert_equal "word", subject.root
  end

  test "#to_s appends a" do
    assert_equal "a word", Word.new(text: "word", needs_a: true).to_s
  end

  test "#to_s skips a" do
    assert_equal "stuff", Word.new(text: "stuff", needs_a: false).to_s
  end
end
