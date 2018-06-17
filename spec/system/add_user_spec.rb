require "rails_helper"

RSpec.describe "adding a user", type: :system do

  it "allows a user to sign up" do
    visit new_user_registration_path
    fill_in "Username", with: "FakeUser"
    fill_in "Email", with: "Fake@fake.com"
    fill_in "Password", with: "Password"
    fill_in "Password confirmation", with: "Password"
    click_on("Sign up")
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  describe "failure cases" do
    let(:non_unique_user) { create(:user, :non_unique) }

    it "does not allow a user sign up with a non-unique username" do
      visit new_user_registration_path
      fill_in "Username", with: non_unique_user.username
      fill_in "Email", with: "unique@unique.com"
      fill_in "Password", with: "Password"
      fill_in "Password confirmation", with: "Password"
      click_on("Sign up")
      expect(page).to have_content("Username has already been taken")
    end

    it "does not allow a user sign up with a non-unique email" do
      visit new_user_registration_path
      fill_in "Username", with: "unique_username"
      fill_in "Email", with: non_unique_user.email
      fill_in "Password", with: "Password"
      fill_in "Password confirmation", with: "Password"
      click_on("Sign up")
      expect(page).to have_content("Email has already been taken")
    end

    it "does not allow a user to sign up without a username" do
      visit new_user_registration_path
      fill_in "Username", with: ""
      fill_in "Email", with: "Fake@fake.com"
      fill_in "Password", with: "Password"
      fill_in "Password confirmation", with: "Password"
      click_on("Sign up")
      expect(page).to have_selector(".new_user")
    end

    it "does not allow a user to sign up without an email address" do
      visit new_user_registration_path
      fill_in "Username", with: "FakeUser"
      fill_in "Email", with: ""
      fill_in "Password", with: "Password"
      fill_in "Password confirmation", with: "Password"
      click_on("Sign up")
      expect(page).to have_selector(".new_user")
    end

    it "does not allow a user to sign up without a password" do
      visit new_user_registration_path
      fill_in "Username", with: "FakeUser"
      fill_in "Email", with: "Fake@fake.com"
      fill_in "Password", with: ""
      fill_in "Password confirmation", with: "Password"
      click_on("Sign up")
      expect(page).to have_selector(".new_user")
    end

    it "does not allow a user to sign up without a password confirmation" do
      visit new_user_registration_path
      fill_in "Username", with: "FakeUser"
      fill_in "Email", with: "Fake@fake.com"
      fill_in "Password", with: "Password"
      fill_in "Password confirmation", with: ""
      click_on("Sign up")
      expect(page).to have_selector(".new_user")
    end

  end

end