FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }

    factory :user_with_role do
      ignore do
        role "worker"
      end

      after(:create) do |user, evaluator|
        user.roles(evaluator.role)
      end
    end
  end
end