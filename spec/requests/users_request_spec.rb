require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }

  before { sign_in user }

  describe '#follow' do
    let(:followed_user) { create(:user) }
    let(:params) { { user_id: followed_user.id } }

    subject { process :follow, method: :get, params: params }

    it 'save' do
      expect { subject }.to change { Follower.count }.by(1)
    end
  end

  describe '#unfollow' do
    let!(:follower) { create :follower, follower: user }
    let(:params) { { user_id: follower.followed_user } }

    subject { process :unfollow, method: :delete, params: params }

    it 'unfollow' do
      expect { subject }.to change { Follower.count }.by(-1)
    end
  end

  describe '#users' do
    subject { process :users, method: :get }

    it { should render_template('users/users') }
  end
end
