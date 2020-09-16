require 'rails_helper'

RSpec.describe User, type: :model do
  context "create new" do
    it 'should be saved' do
      user = build(:user)
      expect(user.save).to be_truthy  
    end
  end
  
end
