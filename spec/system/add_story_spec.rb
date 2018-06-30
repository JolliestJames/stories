require "rails_helper"

RSpec.describe "adding a story", type: :system do
  let(:user) { create(:user) }
  
  xit "allows a user to create a story" do
    log_in_as(user)
    visit new_story_path
    fill_in "Name", with: "Fake Story"
    fill_in "Description", with: "Fake story description"
    click_on("Create Story")
    visit stories_path
    expect(page).to have_content("Fake Story")
  end

end