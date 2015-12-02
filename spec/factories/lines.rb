FactoryGirl.define do
  factory :line, class: Line do
    trait :tweet do
      name "tweet"
    end
  end
end
