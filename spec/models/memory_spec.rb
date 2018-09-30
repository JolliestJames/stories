require "rails_helper"

RSpec.describe Memory do
  let(:memory) { build(:memory) }

  describe "initialization" do
    specify { expect(memory.name).to eq("fake_memory") }
    specify { expect(memory.date).to eq(Date.today) }
    specify { expect(memory.image).to be_an_instance_of(MemoryUploader) }
    specify { expect(memory.description).to eq("Fake description") }
  end

  it "knows a memory's description can be updated" do
    memory.update_description("Fake new description.")
    expect(memory.description).to eq("Fake new description.")
  end

  describe "validations" do
    it "should validate name presence" do
      expect(memory).to validate_presence_of(:name)
    end

    it "should validate image presence" do
      expect(memory).to validate_presence_of(:image)
    end

    it "should validate date presence" do
      expect(memory).to validate_presence_of(:date)
    end

    it "should validate name length" do
      expect(memory).to validate_length_of(:name).
        is_at_least(1).
        is_at_most(255).
        on(:create)
    end

    it "should validate description length" do
      expect(memory).to validate_length_of(:description).
        is_at_most(1000).
        on(:create)
    end
  end
end