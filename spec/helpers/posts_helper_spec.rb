require 'rails_helper'

RSpec.describe PostsHelper, type: :helper do
  describe "mentions_text" do
    before do
      @post_with_no_mentions = Post.new
    end

    it "should return nothing if there are no mentions" do
      expect(mentions_text(@post_with_no_mentions)).to be_nil
    end
  end
end
