require "rails_helper"

RSpec.describe "with users and roles" do

  def confirm_email_and_log_in_as(user)
    visit user_confirmation_path(confirmation_token: user.confirmation_token)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button("Log in")
  end

  let(:user) { create(:user) }

  it "allows a logged in user to view their profile page" do
    confirm_email_and_log_in_as(user)
    visit edit_profile_path
    expect(page).to have_content("Update account")
  end

  it "does not allow a logged in user to view their profile page" do
    visit edit_profile_path
    expect(page).to have_content("")
  end
    
end