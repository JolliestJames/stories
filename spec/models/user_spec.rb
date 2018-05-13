require "rails_helper"

RSpec.describe User do
  let(:user) { User.new(
    first_name: "Fake_first", 
    last_name: "Fake_last",
    email: "fake@fake.com", 
    password: "fake_password") }
  let(:story) { "This is a story" }

  describe "initialization" do
    specify { expect(user.first_name).to eq("Fake_first") }
    specify { expect(user.last_name).to eq("Fake_last") }
    specify { expect(user.email).to eq("fake@fake.com") }
    specify { expect(user.password).to eq("fake_password") }
  end

  # it "knows a user can add a story" do
  #   user.stories << story
  #   expect(user).to have_stories
  # end

end