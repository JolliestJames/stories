require "rails_helper"

RSpec.describe "adding a user", type: :system do
  it "allows a user to sign up" do
    visit new_user_path
    fill_in "First name", with: "First"
    fill_in "Last name", with: "Last"
    fill_in "Email", with: "Fake@fake.com"
    fill_in "Password", with: "Password"
    click_on("Create User")
    visit users_path
    expect(page).to have_content("First")
    expect(page).to have_content("Last")
    expect(page).to have_content("Fake@fake.com")
    expect(page).to have_content("Password")
  end
end