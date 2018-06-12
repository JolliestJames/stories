FactoryBot.define do
  factory :memory do
    name "fake_memory"
    date Date.today
    image "fake_image"
    description "Fake description"
  end
end