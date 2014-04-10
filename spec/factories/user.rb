FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }

    ignore do
      signup false
    end

    after(:build) do |user, evaluator|
      user.password = 'qwqwqwqw' if evaluator.signup
    end

    # create #worker, etc factories
    User::ROLES.each do |this_role|
      factory this_role.to_sym do
        ignore do
          role this_role
        end

        after(:build) do |user, evaluator|
          user.roles = Array evaluator.role
        end
      end
    end

    # TODO
    # factory :guest do
    #   user
    # end
  end
end