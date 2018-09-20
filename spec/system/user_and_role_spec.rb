require "rails_helper"

RSpec.describe "with users and roles" do
  let(:user) { create(:user) }

  it "allows a logged in user to view their profile page" do
    log_in_as(user)
    visit edit_profile_path
    expect(page).to have_content("Update account")
  end

  it "does not allow a logged in user to view their profile page" do
    visit edit_profile_path
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end

end