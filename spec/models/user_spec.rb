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
        expect(user.role?('admin')).to be_false
        user.roles = ['admin']
        expect(user.role?('admin')).to be_true
        expect(user.role?('worker')).to be_false
      end      
      it 'can add multiple roles to a user' do
        expect(user.role?('admin')).to be_false
        expect(user.role?('manager')).to be_false
        expect(user.role?('worker')).to be_false
        user.roles = ['admin', 'worker']
        expect(user.role?('admin')).to be_true
        expect(user.role?('manager')).to be_false
        expect(user.role?('worker')).to be_true
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
        expect(user.role?('admin')).to be_false
      end
    end
  end

  context "factory tests" do
    describe 'user with role' do
      context :worker do
        let(:worker) {build :worker}
        it 'has the worker role' do
          expect(worker.role?('worker')).to be_true
        end
      end
      context :manager do
        let(:manager) {build :manager}
        it 'has the manager role' do
          expect(manager.role?('manager')).to be_true
        end
      end

      context :admin do
        let(:admin) {build :admin}
        it 'has the admin role' do
          expect(admin.role?('admin')).to be_true
        end
      end
    end
  end
end
