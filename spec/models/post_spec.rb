require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'correct' do  
    it 'should be saved' do   
     post = build(:post)
    expect(post.save).to be_truthy  
    end
  end

  context 'without author' do
    it 'return false' do
      post = build(:post, :false_author)
      expect(post.save).to be_falsy
    end
  end

  context 'with short title' do
    it 'return false' do
      post = build(:post, :false_title)
      expect(post.save).to be_falsy
    end
  end

  context "has many posts" do
    it { should have_many(:comments) }
  end

  context "has many likes" do
    it { should have_many(:likes) }
  end

  context "has many comments" do
    it { should have_many(:comments) }
  end


end
