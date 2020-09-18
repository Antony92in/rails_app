require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'create correct comment after post' do
    it 'return true' do
      post = create(:post)
      comment = build(:comment)
      comment.post_id = post.id
      expect(comment.save).to be_truthy
    end
  end

  context 'create comment before post' do
    it 'return false' do
      comment = build(:comment)
      expect(comment.save).to be_falsy
    end
  end

  context 'create without author' do
    it 'return false' do
      post = create(:post)
      comment = build(:comment, :false_author)
      comment.post_id = post.id
      expect(comment.save).to be_falsy
    end
  end

  context 'create with short comment' do
    it 'return false' do
      post = create(:post)
      comment = build(:comment, :short_comment)
      comment.post_id = post.id
      expect(comment.save).to be_falsy
    end
  end

  context 'create with long comment' do
    it 'return false' do
      post = create(:post)
      comment = build(:comment, :long_comment)
      comment.post_id = post.id
      expect(comment.save).to be_falsy
    end
  end
end
