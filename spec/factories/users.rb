FactoryGirl.define do
  factory :user, class: User do
    email 'wendysulca@gmail.com'
    password '12345678'
    password_confirmation '12345678'
    confirmed_at Time.now
  end
end
