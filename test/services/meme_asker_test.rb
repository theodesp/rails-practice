require 'test_helper'

describe MemeAsker, :ask do

  describe "when passed an unpunctuated question" do
    it "should invoke the appropriate predicate method on the meme" do
      @meme = Minitest::Mock.new
      @meme_asker = MemeAsker.new @meme
      @meme.expect :will_it_blend?, :return_value

      @meme_asker.ask "will it blend"

      @meme.verify
    end
  end
end
