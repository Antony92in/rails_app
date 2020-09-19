require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
    let(:user) { create(:user) }
    let(:post) { create(:post) }
    
    
    
    before { sign_in user }

    describe "#create" do
    let(:params) { { post_id: post, author: user, comment: 'comment' } }

    subject { process :create , method: :post , params: params }
   
      it "correct save" do
      expect { subject }.to change { Comment.count }.by(1)
      end
    end

    
    
end
