require "rails_helper"

RSpec.describe User do
  let(:user) { User.new }
  let(:memory) { "This is a memory" }

  it "knows a user can add a memory" do
    user.memories << memory
    expect(user).to have_memories
  end

end