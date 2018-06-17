FactoryBot.define do
  factory :user do
    username "Fake_username"
    first_name "Fake_first"
    last_name "Fake_last"
    email "fake@fake.com"
    password "fake_password"

    trait :non_unique do
      username "non_unique_username"
      email "non-unique@non-unique.com"
    end

  end
end