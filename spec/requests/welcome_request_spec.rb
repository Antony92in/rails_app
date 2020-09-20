require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  let(:user) { create(:user) }
  describe 'GET #show' do
    before { get :index }

    it { should render_template('welcome') }
  end

  describe "#mypage" do
    before { sign_in user }

    subject { process :mypage, method: :get }

    it { should render_template('mypage')}
  end

  describe "#feed" do
    before { sign_in user }

    subject { process :feed, method: :get }

    it { should render_template('feed')}
  end
  
end
