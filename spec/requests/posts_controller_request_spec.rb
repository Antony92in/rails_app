require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }
  let(:params) do
    { post: attributes_for(:post) }
  end
  before { sign_in user }

  describe "POST #create" do
  context "with valid params" do

    it "redirects to the created ad" do
    post :create, params: params
      expect(response).to redirect_to('/mypage')
    end
  end
end
end
