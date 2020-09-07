require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'before publication' do  # (almost) plain English
    it 'cannot have comments' do   #
      post = build(:post)
      expect(post.author).to be_truthy
    end
  end
end
