require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }
  
  before { sign_in user }

  describe "POST #create" do
    context "with valid params" do
      let(:params) do
        { post: attributes_for(:post) }
      end
      it "redirects to the created ad" do
       post :create, params: params
      expect(response).to redirect_to('/mypage')
      end
    end
  end

  describe "#edit" do
    let!(:post) { create :post, user: user }
    let(:params) { { id: post, user_id: user } }

    subject { process :edit, method: :get, params: params }

    it { is_expected.to render_template(:edit) }

    it "assign" do
      subject
      expect(assigns :post).to eq post  
    end
  end

  describe "#update" do
    let!(:post) { create :post, user: user }
    let(:params) { { id: post, author: user, post: { title: 'new title' } } }

    subject { process :update, method: :put, params: params } 

    it "update" do
      expect { subject }.to change { post.reload.title }.to('new title')
    end

    context "with bad params" do
      let(:params) { { id: post, author: user, post: { title: '' } } }
      it "does not update" do
        expect { subject }.not_to change { post.reload.title }
      end
    end
  end
  
  describe "#destroy" do
  let!(:post) { create :post, user: user }
  let(:params) { { id: post, author: user } }

    subject { process :destroy, method: :delete, params: params }
    
    it "post delete" do
      expect { subject }.to change { Post.count }.by(-1)
    end
    
  end
  
  
  

end
