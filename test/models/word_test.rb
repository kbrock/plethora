require 'test_helper'

describe Word do
  it "strip downcases text" do
    subject = Word.new(text: "  WOrd  ").tap { |s| s.valid? }
    assert_equal "word", subject.text
  end

  # move to translate?
  test "noun to a turns into prepositional clause" do
    assert_equal "a word of", Word.new(text: "word", pos: "noun").adj
  end

  test "adj to adj is a nop" do
    assert_equal "stuff", Word.new(text: "stuff", pos: "adj").adj
  end

  test "#random - basic" do
    Word.create(root: "bad", text: "terrible", pos: "noun")
    great = Word.create(root: "great", text: "super", pos: "noun")
    assert_equal great, Word.random("great")
  end

  test "#root_hashes" do
    Word.create(root: "bad", text: "terrible", pos: "noun")
    great = Word.create(root: "great", text: "super", pos: "noun")
    funny = Word.create(root: "funny", text: "riveting", pos: "adj")

    assert_equal({great: great}, Word.root_hashes(%w(great)))
    assert_equal({great: great, funny: funny}, Word.root_hashes(%w(great funny)))
  end
end
