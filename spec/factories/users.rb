FactoryBot.define do
  factory :user do
    username "Fake_username"
    first_name "Fake_first"
    last_name "Fake_last"
    email "fake@fake.com"
    password "fake_password"
    avatar { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/files/me.jpg'), 'image/jpeg') }

    trait :non_unique do
      username "non_unique_username"
      email "non-unique@non-unique.com"
    end

    after(:create) do |user|
      user.confirm
    end

  end
end