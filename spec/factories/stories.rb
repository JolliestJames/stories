FactoryBot.define do
  factory :story do
    name { "fake_story" }
    description { "fake_story_description" }
    user
  end
end