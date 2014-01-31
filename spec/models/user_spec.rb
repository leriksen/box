require 'spec_helper'

describe User do
  let(:user) {build :user}
  describe :create do
    context :basic_user do
      it 'can create a user' do
        user.email.should match(/example[.]com/) 
      end
    end    
  end
  
  describe :roles= do
    context 'basic_user' do
      it 'can add one role to a user' do
        user.role?(:admin).should be_false
        user.roles = [:admin]
        user.role?(:admin).should be_true
        user.role?(:worker).should be_false
      end      
      it 'can add multiple roles to a user' do
        user.role?(:admin).should be_false
        user.role?(:manager).should be_false
        user.role?(:worker).should be_false
        user.roles = [:admin, :worker]
        user.role?(:admin).should be_true
        user.role?(:manager).should be_false
        user.role?(:worker).should be_true
      end      
    end
  end
  describe :roles do
    context :basic_user do
      it 'should be empty for a new user' do
        user.roles.should be_empty
      end
    end
  end

  describe :role? do
    context :basic_user do
      it 'should not be true of admin role' do
        user.role?(:admin).should be_false
      end
    end
  end
end
