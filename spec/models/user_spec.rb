require "rails_helper"

RSpec.describe User do
  let(:user) { User.new("Fake_first", "Fake_last", "fake@fake.com", "fake_password") }
  let(:story) { "This is a story" }

  describe "initialization" do
    specify { expect(user.first_name).not_to be_nil }
    specify { expect(user.last_name).not_to be_nil }
    specify { expect(user.email).not_to be_nil }
    specify { expect(user.password).not_to be_nil }
  end

  it "knows a user can add a story" do
    user.stories << story
    expect(user).to have_stories
  end

end