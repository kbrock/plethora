class Translator
  TRANSLATIONS = {
    "noun" => {
      "adj" => "a %s of"
    }
  }

  def self.translate(pos_from, pos_to, word)
    if pos_from == pos_to
      word
    elsif translation = TRANSLATIONS[pos_from].try(:[], pos_to)
      format(translation, word)
    else
      # do we want to warn?
      word
    end
  end
end
