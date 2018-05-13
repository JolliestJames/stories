require "rails_helper"

RSpec.describe Memory do
  let(:memory) { Memory.new(
    name: "The day I met her",
    date: Date.new(2017, 8, 13),
    image: "link_to_picture",
    description: "An impromptu breakfast leads to me meeting my future wife.") }

  describe "initialization" do
    specify { expect(memory.name).to eq("The day I met her")}
    specify { expect(memory.date).to eq(Date.parse("13th Aug 2017"))}
    specify { expect(memory.image).to eq("link_to_picture")}
    specify { expect(memory.description).to eq("An impromptu breakfast leads to me meeting my future wife.")}
  end

  it "knows a memory's description can be updated" do
    memory.update_description("Her name was Chelsea.")
    expect(memory.description).to eq("Her name was Chelsea.")
  end

end