require "rails_helper"

RSpec.describe "adding a user", type: :system do

  it "allows a user to sign up and confirm their email" do
    visit register_path
    fill_in "Username", with: "FakeUser"
    fill_in "Email", with: "Fake@fake.com"
    fill_in "Password", with: "Password"
    fill_in "Password confirmation", with: "Password"
    click_on("Sign up")
    @user = User.find(1)
    visit user_confirmation_path(confirmation_token: @user.confirmation_token)
    expect(page).to have_content("Your email address has been successfully confirmed.")
  end

  describe "failure cases" do
    let(:non_unique_user) { create(:user, :non_unique) }

    it "does not allow a user sign up with a non-unique username" do
      visit register_path
      fill_in "Username", with: non_unique_user.username
      fill_in "Email", with: "unique@unique.com"
      fill_in "Password", with: "Password"
      fill_in "Password confirmation", with: "Password"
      click_on("Sign up")
      expect(page).to have_content("Username has already been taken")
    end

    it "does not allow a user sign up with a non-unique email" do
      visit register_path
      fill_in "Username", with: "unique_username"
      fill_in "Email", with: non_unique_user.email
      fill_in "Password", with: "Password"
      fill_in "Password confirmation", with: "Password"
      click_on("Sign up")
      expect(page).to have_content("Email has already been taken")
    end

    it "does not allow a user to sign up without a username" do
      visit register_path
      fill_in "Username", with: ""
      fill_in "Email", with: "Fake@fake.com"
      fill_in "Password", with: "Password"
      fill_in "Password confirmation", with: "Password"
      click_on("Sign up")
      expect(page).to have_selector(".new_user")
    end

    it "does not allow a user to sign up without an email address" do
      visit register_path
      fill_in "Username", with: "FakeUser"
      fill_in "Email", with: ""
      fill_in "Password", with: "Password"
      fill_in "Password confirmation", with: "Password"
      click_on("Sign up")
      expect(page).to have_selector(".new_user")
    end

    it "does not allow a user to sign up without a password" do
      visit register_path
      fill_in "Username", with: "FakeUser"
      fill_in "Email", with: "Fake@fake.com"
      fill_in "Password", with: ""
      fill_in "Password confirmation", with: "Password"
      click_on("Sign up")
      expect(page).to have_selector(".new_user")
    end

    it "does not allow a user to sign up without a password confirmation" do
      visit register_path
      fill_in "Username", with: "FakeUser"
      fill_in "Email", with: "Fake@fake.com"
      fill_in "Password", with: "Password"
      fill_in "Password confirmation", with: ""
      click_on("Sign up")
      expect(page).to have_selector(".new_user")
    end

  end

end