class MemeAsker
  def initialize(meme)
    @meme = meme
  end

  def ask(question)
    method = question.tr(" ", "_") + "?"
    @meme.__send__(method)
  end
end
