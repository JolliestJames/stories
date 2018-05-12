require "rails_helper"

RSpec.describe Memory do
  let(:memory) { Memory.new(
    "The day I met her",
    "8/13/2017",
    "link_to_picture",
    "An impromptu breakfast leads to me meeting my future wife") }

  describe "initialization" do
    specify { expect(memory.name).to eq("The day I met her")}
    specify { expect(memory.date).to eq("8/13/2017")}
    specify { expect(memory.image).to eq("link_to_picture")}
    specify { expect(memory.description).to eq("An impromptu breakfast leads to me meeting my future wife")}
  end

end