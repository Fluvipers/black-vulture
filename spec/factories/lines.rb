FactoryGirl.define do
  factory :line, class: Line do
    trait :tweet_line do
      name "tweet"
    end
  end
end
