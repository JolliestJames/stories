require "rails_helper"

RSpec.describe Story do
  let(:story) { build(:story) }
  let(:memory) { build(:memory) }

  describe "initialization" do
    specify { expect(story.name).to eq("fake_story") }
    specify { expect(story.description).to eq("fake_story_description")}
  end

  it "allows a story to add a memory" do
    story.add_memory(memory)
    expect(story.memories).not_to be_empty
  end

end