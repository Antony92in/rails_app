require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }
  before { sign_in user }

  describe "POST #create" do
  context "with valid params" do

    it "redirects to the created ad" do
      post :create, params: { post: {title: 'some title', content: 'some content', author: 'jonny'}}
      expect(response).to redirect_to('/mypage')
    end
  end
end
  
end
