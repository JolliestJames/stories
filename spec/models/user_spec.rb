require "rails_helper"

RSpec.describe User do
  let(:user) { User.new(
    username: "Fake_username",
    first_name: "Fake_first", 
    last_name: "Fake_last",
    email: "fake@fake.com", 
    password: "fake_password") }
  let(:story) { Story.new(
    name: "Mr. and Mrs. Martinez",
    description: "My favorite story.",
    user_id: user.id) }

  describe "initialization" do
    specify { expect(user.username).to eq("Fake_username")}
    specify { expect(user.first_name).to eq("Fake_first") }
    specify { expect(user.last_name).to eq("Fake_last") }
    specify { expect(user.email).to eq("fake@fake.com") }
    specify { expect(user.password).to eq("fake_password") }
  end

  it "knows a user can add a story" do
    user.add_story(story)
    expect(user.stories).not_to be_empty
  end

end