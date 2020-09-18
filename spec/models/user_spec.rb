require 'rails_helper'

RSpec.describe User, type: :model do
  context 'create new' do
    it 'should be saved' do
      user = build(:user)
      expect(user.save).to be_truthy
    end
  end

  context 'has many posts' do
    it { should have_many(:posts) }
  end

  context 'has many followers' do
    it { should have_many(:followers) }
  end

  context 'has many followings' do
    it { should have_many(:followings) }
  end

  context 'has one attached avatar' do
    it { should have_one_attached(:avatar) }
  end
end
