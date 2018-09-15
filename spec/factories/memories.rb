FactoryBot.define do
  factory :memory do
    name { "fake_memory" }
    date { Date.today }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/files/me.jpg'), 'image/jpeg') }
    description { "Fake description" }
    story
  end
end