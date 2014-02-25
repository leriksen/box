FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    encrypted_password "qwqwqwqw"

    # create #worker, etc factories
    User::ROLES.each do |this_role|
      factory this_role.to_sym do
        ignore do
          role this_role
        end

        after(:create) do |user, evaluator|
          user.roles(evaluator.role)
        end
      end
    end
  end
end