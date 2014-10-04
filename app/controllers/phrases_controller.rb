class PhrasesController < ApplicationController
  def index
    @phrase = Sentence.first.to_s
  end
end
