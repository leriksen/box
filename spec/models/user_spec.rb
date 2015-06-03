require 'rails_helper'
require 'cancan/matchers'

describe User do
  subject {build :user}
  context :basic_user do
    describe :defaults do
      it 'can create a user' do
        expect(subject).to be_instance_of(User) 
        expect(subject.email).to match(/example[.]com/) 
      end
    end
  end
  
  describe :roles= do
    it 'can add one role to a user' do
      expect(subject.role?('admin')).to be_falsey
      subject.roles = ['admin']
      expect(subject.role?('admin')).to be_truthy
      expect(subject.role?('staff')).to be_falsey
    end      

    it 'can add multiple roles to a user' do
      expect(subject.role?('admin')).to be_falsey
      expect(subject.role?('manager')).to be_falsey
      expect(subject.role?('staff')).to be_falsey
      subject.roles = ['admin', :manager]
      expect(subject.role?('admin')).to be_truthy
      expect(subject.role?('manager')).to be_truthy
      expect(subject.role?('staff')).to be_falsey
    end      

    it 'will not let any other role be assigned the customer role' do
      subject.roles = ['admin']
      expect(subject.role?('admin')).to be_truthy
      subject.roles = ['admin', 'customer']
      expect(subject.role?('admin')).to be_truthy
      expect(subject.role?('customer')).to be_falsey
    end      

    it 'will not let a customer have any role added' do
      subject.roles = ['customer']
      expect(subject.role?('customer')).to be_truthy
      subject.roles = ['admin', 'customer']
      expect(subject.role?('customer')).to be_truthy
    end
  end

  describe :roles do
    context :basic_user do
      it 'to be empty for a new user' do
        expect(subject.roles).to be_empty
      end
    end
    context :admin_user do
      subject {build :admin}
      it 'to be non-empty for a admin user' do
        expect(subject.roles).to eq(['admin'])
      end
    end
  end

  describe :role? do
    context :basic_user do
      it 'to not have the admin role' do
        expect(subject.role?('admin')).to be_falsey
      end
    end
  end

  context "factory tests" do
    describe 'user with role' do
      context :staff do
        let(:staff) {build :staff}
        it 'has the staff role' do
          expect(staff.role?('staff')).to be_truthy
        end
      end
      context :manager do
        let(:manager) {build :manager}
        it 'has the manager role' do
          expect(manager.role?('manager')).to be_truthy
        end
      end

      # TODO
      # context :guest do
      #   let(:guest) {build :guest}
      #   it 'has the guest role' do
      #     expect(guest.role?('guest')).to be_truthy
      #   end
      # end
    end
  end

  # there are two user concepts to keep clear here
  # 1. the user doing the role
  # 2. the user subject to the abilities of the role
  #
  # in these tests, the 'user' is the user doing the role (1 from list)
  # and the 'candidate' is the user subjected to the role (2 from list)
  describe :abilities do
    subject(:ability) {Ability.new user}

    context :administrator do
      let(:user) {build :admin}

      it 'can manager a user' do
        expect(user.is? :admin).to be_truthy
        expect(subject).to be_able_to(:manage, (build :user))
      end

      it 'cannot change a customer to anything else' do
        candidate = build :customer
        candidate.roles = [:staff]

        expect(candidate.is? :staff).to be_falsey
      end
    end

    context :manager do
      let(:user) {build :manager}

        it 'can create a user that is not an admin' do
          expect(subject).to be_able_to(:create, (build :staff))
          expect(subject).to be_able_to(:create, (build :customer))
          expect(subject).to be_able_to(:create, (build :manager))
        end

        # it 'can not create an admin user' do
        #   expect(subject).not_to be_able_to(:create, (build :admin))
        # end

      #   it 'cannot create an administrator' do
      #     expect(subject)
      #   end
    end

    # context :staff do
    # end

    # context :customer do
    # end

    # context :guest do
    #   let(:role) {nil}
    #   it 'creates a guest user' do
    #     expect(user.role? :guest).to be_truthy
    #   end
    # end
  end
end
