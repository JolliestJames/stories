require "rails_helper"

RSpec.describe Memory do
  let(:memory) { Memory.new(
    name: "Fake name",
    date: Date.new(2017, 8, 13),
    image: "fake_image",
    description: "Fake description") }

  describe "initialization" do
    specify { expect(memory.name).to eq("Fake name")}
    specify { expect(memory.date).to eq(Date.parse("13th Aug 2017"))}
    specify { expect(memory.image).to eq("fake_image")}
    specify { expect(memory.description).to eq("Fake description")}
  end

  it "knows a memory's description can be updated" do
    memory.update_description("Fake new description.")
    expect(memory.description).to eq("Fake new description.")
  end

end