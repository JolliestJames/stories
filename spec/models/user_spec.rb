require "rails_helper"

RSpec.describe User do
  let(:user) { User.new("Fake_first", "Fake_last", "fake@fake.com", "fake_password") }
  let(:memory) { "This is a memory" }

  describe "initialization" do
    specify { expect(user.first_name).not_to be_nil }
    specify { expect(user.last_name).not_to be_nil }
    specify { expect(user.email).not_to be_nil }
    specify { expect(user.password).not_to be_nil }
  end
  
  it "knows a user can add a memory" do
    user.memories << memory
    expect(user).to have_memories
  end

end