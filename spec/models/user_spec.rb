require 'spec_helper'

describe User do
  let(:user) {build :user}
  describe :create do
    context :basic_user do
      it 'can create a user' do
        expect(user.email).to match(/example[.]com/) 
      end
    end    
  end
  
  describe :roles= do
    context 'basic_user' do
      it 'can add one role to a user' do
        expect(user.role?(:admin)).to be_false
        # roles will be passed from a form as an array of strings
        user.roles = ['admin']
        expect(user.role?(:admin)).to be_true
        expect(user.role?(:worker)).to be_false
      end      
      it 'can add multiple roles to a user' do
        expect(user.role?(:admin)).to be_false
        expect(user.role?(:manager)).to be_false
        expect(user.role?(:worker)).to be_false
        user.roles = ['admin', 'worker']
        expect(user.role?(:admin)).to be_true
        expect(user.role?(:manager)).to be_false
        expect(user.role?(:worker)).to be_true
      end      
    end
  end
  describe :roles do
    context :basic_user do
      it 'to be empty for a new user' do
        expect(user.roles).to be_empty
      end
    end
  end

  describe :role? do
    context :basic_user do
      it 'to not be true of admin role' do
        expect(user.role?(:admin)).to be_false
      end
    end
  end
end
