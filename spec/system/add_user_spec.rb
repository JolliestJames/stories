require "rails_helper"

RSpec.describe "adding a user", type: :system do
  it "allows a user to sign up" do
    visit signup_path
    fill_in "Username", with: "FakeUser"
    fill_in "Email", with: "Fake@fake.com"
    fill_in "Password", with: "Password"
    click_on("Create User")
    visit users_path
    @user = User.find_by(username: "FakeUser")
    expect(page).to have_selector(
      "#user_#{@user.id} .username", text: "FakeUser")
    expect(page).to have_content("Fake@fake.com")
    expect(page).to have_content("Password")
  end

  it "does not allow a user to sign up without a user name" do
    visit signup_path
    fill_in "Username", with: ""
    fill_in "Email", with: "Fake@fake.com"
    fill_in "Password", with: "Password"
    click_on("Create User")
    expect(page).to have_selector(".new_user")
  end

  it "does not allow a user to sign up without an email address" do
    visit signup_path
    fill_in "Username", with: "FakeUser"
    fill_in "Email", with: ""
    fill_in "Password", with: "Password"
    click_on("Create User")
    expect(page).to have_selector(".new_user")
  end

  it "does not allow a user to sign up without a password" do
    visit signup_path
    fill_in "Username", with: "FakeUser"
    fill_in "Email", with: "Fake@fake.com"
    fill_in "Password", with: ""
    click_on("Create User")
    expect(page).to have_selector(".new_user")
  end

end