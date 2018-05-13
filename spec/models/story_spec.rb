require "rails_helper"

RSpec.describe Story do
  let(:story) { Story.new(
    name: "Mr. and Mrs. Martinez",
    description: "My favorite story.") }
  
  let(:memory) { Memory.new(
    name: "The day I met her",
    date: Date.new(2017, 8, 13),
    image: "link_to_picture",
    description: "An impromptu breakfast leads to me meeting my future wife.") }

  describe "initialization" do
    specify { expect(story.name).to eq("Mr. and Mrs. Martinez") }
    specify { expect(story.description).to eq("My favorite story.")}
  end

  it "allows a story to add a memory" do
    story.add_memory(memory)
    expect(story.memories).not_to be_empty
  end

end