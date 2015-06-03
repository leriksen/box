require "cancan/matchers"

describe User do
  subject(:ability){Ability.new user}
  context :guest do
    let(:user) {build :guest}

    it{ should be_able_to(:create, build(:customer)) }
    it{ should_not be_able_to(:create, build(:guest)) }
    it{ should_not be_able_to(:create, build(:staff)) }
    it{ should_not be_able_to(:create, build(:manager)) }
    it{ should_not be_able_to(:create, build(:admin)) }

    it{ should_not be_able_to(:update, build(:guest)) }
    it{ should_not be_able_to(:update, build(:customer)) }
    it{ should_not be_able_to(:update, build(:staff)) }
    it{ should_not be_able_to(:update, build(:manager)) }
    it{ should_not be_able_to(:update, build(:admin)) }

    it{ should_not be_able_to(:read, build(:guest)) }
    it{ should_not be_able_to(:read, build(:customer)) }
    it{ should_not be_able_to(:read, build(:staff)) }
    it{ should_not be_able_to(:read, build(:manager)) }
    it{ should_not be_able_to(:read, build(:admin)) }

    it{ should_not be_able_to(:delete, build(:guest)) }
    it{ should_not be_able_to(:delete, build(:customer)) }
    it{ should_not be_able_to(:delete, build(:staff)) }
    it{ should_not be_able_to(:delete, build(:manager)) }
    it{ should_not be_able_to(:delete, build(:admin)) }
  end

  context :customer do
    let(:user) {create :customer, signup: true}

    it{ should_not be_able_to(:create, build(:guest)) }
    it{ should_not be_able_to(:create, build(:customer)) }
    it{ should_not be_able_to(:create, build(:staff)) }
    it{ should_not be_able_to(:create, build(:manager)) }
    it{ should_not be_able_to(:create, build(:admin)) }

    it{ should_not be_able_to(:update, build(:guest)) }
    it{ should be_able_to(:update, user) }
    it{ should_not be_able_to(:update, build(:staff)) }
    it{ should_not be_able_to(:update, build(:manager)) }
    it{ should_not be_able_to(:update, build(:admin)) }

    it{ should_not be_able_to(:read, build(:guest)) }
    it{ should be_able_to(:read, user) }
    it{ should_not be_able_to(:read, build(:staff)) }
    it{ should_not be_able_to(:read, build(:manager)) }
    it{ should_not be_able_to(:read, build(:admin)) }

    it{ should_not be_able_to(:delete, build(:guest)) }
    it{ should_not be_able_to(:delete, build(:customer)) }
    it{ should_not be_able_to(:delete, build(:staff)) }
    it{ should_not be_able_to(:delete, build(:manager)) }
    it{ should_not be_able_to(:delete, build(:admin)) }
  end

  context :staff do
    let(:user) {create :staff, signup: true}

    it{ should_not be_able_to(:create, build(:guest)) }
    it{ should be_able_to(:create, build(:customer)) }
    it{ should be_able_to(:create, build(:staff)) }
    it{ should_not be_able_to(:create, build(:manager)) }
    it{ should_not be_able_to(:create, build(:admin)) }

    it{ should_not be_able_to(:update, build(:guest)) }
    it{ should be_able_to(:update, build(:customer)) }
    it{ should be_able_to(:update, build(:staff)) }
    it{ should_not be_able_to(:update, build(:manager)) }
    it{ should_not be_able_to(:update, build(:admin)) }

    it{ should_not be_able_to(:read, build(:guest)) }
    it{ should be_able_to(:read, build(:customer)) }
    it{ should be_able_to(:read, build(:staff)) }
    it{ should_not be_able_to(:read, build(:manager)) }
    it{ should_not be_able_to(:read, build(:admin)) }

    it{ should_not be_able_to(:delete, build(:guest)) }
    it{ should_not be_able_to(:delete, build(:customer)) }
    it{ should_not be_able_to(:delete, build(:staff)) }
    it{ should_not be_able_to(:delete, build(:manager)) }
    it{ should_not be_able_to(:delete, build(:admin)) }
  end

  context :manager do
    let(:user) {create :manager, signup: true}

    it{ should_not be_able_to(:create, build(:guest)) }
    it{ should be_able_to(:create, build(:customer)) }
    it{ should be_able_to(:create, build(:staff)) }
    it{ should be_able_to(:create, build(:manager)) }
    it{ should_not be_able_to(:create, build(:admin)) }

    it{ should_not be_able_to(:update, build(:guest)) }
    it{ should be_able_to(:update, build(:customer)) }
    it{ should be_able_to(:update, build(:staff)) }
    it{ should be_able_to(:update, build(:manager)) }
    it{ should_not be_able_to(:update, build(:admin)) }

    it{ should_not be_able_to(:read, build(:guest)) }
    it{ should be_able_to(:read, build(:customer)) }
    it{ should be_able_to(:read, build(:staff)) }
    it{ should be_able_to(:read, build(:manager)) }
    it{ should_not be_able_to(:read, build(:admin)) }

    it{ should_not be_able_to(:delete, build(:guest)) }
    it{ should_not be_able_to(:delete, build(:customer)) }
    it{ should_not be_able_to(:delete, build(:staff)) }
    it{ should_not be_able_to(:delete, build(:manager)) }
    it{ should_not be_able_to(:delete, build(:admin)) }
  end

  context :admin do
    let(:user) {create :admin, signup: true}

    it{ should be_able_to(:manage, build(:guest)) }
    it{ should be_able_to(:manage, build(:customer)) }
    it{ should be_able_to(:manage, build(:staff)) }
    it{ should be_able_to(:manage, build(:manager)) }
    it{ should be_able_to(:manage, build(:admin)) }
  end
end