class Word < ActiveRecord::Base
  validates :root, presence: true
  validates :text, presence:true, uniqueness: true

  before_validation do
    self.root = self.root.downcase.strip if self.root
    self.text = self.text.downcase.strip if self.text
  end

  def to_s
    needs_a ? "a #{text}" : text
  end

  def random
    self.class(root)
  end

  def self.random(root)
    # inefficient, would like something closer to this:
    # "id>=random()*(select count(*) from #{table_name})"
    order("random()").where(root: root).limit(1).first
  end
end
