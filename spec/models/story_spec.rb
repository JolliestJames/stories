require "rails_helper"

RSpec.describe Story do
  let(:story) { build(:story) }
  let(:memory) { build(:memory) }

  describe "initialization" do
    specify { expect(story.name).to eq("fake_story") }
    specify { expect(story.description).to eq("fake_story_description")}
  end

  it "should validate name presence" do
    expect(story).to validate_presence_of(:name)
  end

  it "should validate description presence" do
    expect(story).to validate_presence_of(:description)
  end

  it "should validate name length" do
    expect(story).to validate_length_of(:name).
      is_at_least(1).
      is_at_most(50).
      on(:create)
  end

  it "should validate description length" do
    expect(story).to validate_length_of(:description).
      is_at_least(1).
      is_at_most(1024).
      on(:create)
  end

  it "allows a story to add a memory" do
    story.add_memory(memory)
    expect(story.memories).not_to be_empty
  end

end