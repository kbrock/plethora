class Word < ActiveRecord::Base
  # translate from one part of speach to another

  # the root word
  validates :root, presence: true
  # the alternate word
  validates :text, presence:true, uniqueness: true

  before_validation do
    self.root = self.root.downcase.strip if self.root
    self.text = self.text.downcase.strip if self.text
  end

  def adj
    Translator.translate(pos, "adj", text)
  end

  def random
    self.class(root)
  end

  def self.random(root)
    # inefficient, would like something closer to this:
    # "id>=random()*(select count(*) from #{table_name})"
    order("random()").where(root: root).limit(1).first
  end

  def self.root_hashes(roots)
    roots.map.with_object({}) {|root, dest| dest[root.to_sym] = Word.random(root) }
  end
end
