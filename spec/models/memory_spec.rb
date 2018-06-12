require "rails_helper"

RSpec.describe Memory do
  let(:memory) { build(:memory) }

  describe "initialization" do
    specify { expect(memory.name).to eq("fake_memory")}
    specify { expect(memory.date).to eq(Date.today)}
    specify { expect(memory.image).to eq("fake_image")}
    specify { expect(memory.description).to eq("Fake description")}
  end

  it "knows a memory's description can be updated" do
    memory.update_description("Fake new description.")
    expect(memory.description).to eq("Fake new description.")
  end

end