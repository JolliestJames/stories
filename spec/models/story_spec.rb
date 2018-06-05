require "rails_helper"

RSpec.describe Story do
  let(:story) { Story.new(
    name: "Fake story name",
    description: "Fake story description") }
  
  let(:memory) { Memory.new(
    name: "Fake memory name",
    date: Date.new(2017, 8, 13),
    image: "Fake_picture",
    description: "Fake memory description") }

  describe "initialization" do
    specify { expect(story.name).to eq("Fake story name") }
    specify { expect(story.description).to eq("Fake story description")}
  end

  it "allows a story to add a memory" do
    story.add_memory(memory)
    expect(story.memories).not_to be_empty
  end

end