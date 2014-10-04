class Sentence < ActiveRecord::Base
  # "phrase with %{slots} delimiters"
  # TODO: think I want to go towards %<word>s where s is the part of speach
  validates :text, presence: true

  # Hash<String,String> slot => word
  attr_accessor :words

  def slots
    text.scan(/%[<\{]([^>\}]*)[>\}]/).flatten.uniq
  end

  def words
    @words ||= words_for_slots
  end

  # maybe this lives in a sentence builder class or something
  def to_s
    format(text, words)
  end

  private

  def words_for_slots
    Word.root_hashes(slots).values.each_with_object({}) do |word, hash|
      hash[word.root.to_sym] = word.adj
    end
  end
end
