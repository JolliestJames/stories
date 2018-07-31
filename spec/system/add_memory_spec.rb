require "rails_helper"

RSpec.describe "adding a memory", type: :system do
  let(:user) { create(:user) }
  let(:story) { create(:story, user: user) }

  it "allows a user to create a story" do
    log_in_as(user)
    save story
    visit new_memory_path
    fill_in "Name", with: "Fake Memory"
    fill_in "Description", with: "Fake memory description"
    fill_in "Image", with: "Fake image"
    fill_in "Date", with: Date.today.strftime('%Y-%m-%d')
    select "fake_story", from: "Story"
    click_on("Create Memory")
    visit memories_path
    expect(page).to have_content("Fake Memory")
  end

end