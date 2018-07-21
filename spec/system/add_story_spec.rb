require "rails_helper"

RSpec.describe "adding a story", type: :system do
  let(:user) { create(:user) }
  
  it "allows a user to create a story" do
    log_in_as(user)
    visit new_story_path
    fill_in "Name", with: "Fake Story"
    fill_in "Description", with: "Fake story description"
    click_on("Create Story")
    visit stories_path
    expect(page).to have_content("Fake Story")
  end

  it "does not allow a user to create a story without a name" do
    log_in_as(user)
    visit new_story_path
    fill_in "Name", with: ""
    fill_in "Description", with: "Fake story description"
    click_on("Create Story")
    expect(page).to have_selector(".new_story")  
  end

  it "does not allow a user to create a story without a description" do
    log_in_as(user)
    visit new_story_path
    fill_in "Name", with: "Fake Story"
    fill_in "Description", with: ""
    click_on("Create Story")
    expect(page).to have_selector(".new_story")  
  end

  it "does not allow a user to create a story without being logged in" do
    visit new_story_path
    expect(page).to have_content("You need to sign in or sign up before continuing")  
  end

end