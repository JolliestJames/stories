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