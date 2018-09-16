require "rails_helper"

RSpec.describe "adding a memory", type: :system do
  let(:user) { create(:user) }
  let(:story) { create(:story, user: user) }
  let(:photo) { Rails.root.join('spec/support/files/me.jpg') }

  it "allows a user to create a memory" do
    log_in_as(user)
    save story
    visit new_memory_path
    fill_in "Name", with: "Fake Memory"
    fill_in "Description", with: "Fake memory description"
    fill_in "Date", with: Date.today.strftime('%Y-%m-%d')
    attach_file "Image", photo
    select "fake_story", from: "Story"
    click_on("Create Memory")
    visit memories_path
    expect(page).to have_content("Fake Memory")
  end
end