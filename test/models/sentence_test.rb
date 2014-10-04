require "test_helper"

describe Sentence do
  it "describes slots for words" do
    subject = Sentence.new(text: "this is %<great>s %{book}")

    assert_equal %w(book great), subject.slots.sort    
  end

  it "produces puts words into slots" do
    subject = Sentence.new(text: "this is %<great>s %{book}", words: {great: "a spectacle of", book: "novel"})

    assert_equal "this is a spectacle of novel", subject.to_s
  end  

  it "looks up words" do
    Word.create(root: "great", text: "spectacle", pos: "noun")
    Word.create(root: "book", text: "novel", pos: "adj")
    subject = Sentence.new(text: "this is %<great>s %{book}")

    assert_equal "this is a spectacle of novel", subject.to_s
  end  
end
