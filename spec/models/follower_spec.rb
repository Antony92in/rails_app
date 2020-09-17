require 'rails_helper'

RSpec.describe Follower, type: :model do
 

  context 'correct follow' do  
    it 'should be saved' do   
    fol = build(:follower)
    expect(fol.save).to be_truthy  
    end
  end

  context 'not correct' do  
    it 'should not be saved' do   
    fol = build(:follower, :false_follower)
    expect(fol.save).to be_falsy  
    end
  end

  context 'not correct' do  
    it 'should not be saved' do   
    fol = build(:follower, :false_followed_user)
    expect(fol.save).to be_falsy  
    end
  end

 
end
