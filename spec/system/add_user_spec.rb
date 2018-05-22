require "rails_helper"

RSpec.describe "adding a user", type: :system do
  it "allows a user to sign up" do
    visit new_user_path
    fill_in "First name", with: "First"
    fill_in "Last name", with: "Last"
    fill_in "Email", with: "Fake@fake.com"
    fill_in "Password", with: "Password"
    click_on("Create User")
    @user = User.find_by(first_name: "First")
    expect(page).to have_selector(
      "#user_#{@user.id} .first_name", text: "First")
    expect(page).to have_content("Last")
    expect(page).to have_content("Fake@fake.com")
    expect(page).to have_content("Password")
  end

  it "does not allow a user to sign up without a first name" do
    visit new_user_path
    fill_in "First name", with: ""
    fill_in "Last name", with: "Last"
    fill_in "Email", with: "Fake@fake.com"
    fill_in "Password", with: "Password"
    click_on("Create User")
    expect(page).to have_selector(".new_user")
  end

  it "does not allow a user to sign up without a last name" do
    visit new_user_path
    fill_in "First name", with: "First"
    fill_in "Last name", with: ""
    fill_in "Email", with: "Fake@fake.com"
    fill_in "Password", with: "Password"
    click_on("Create User")
    expect(page).to have_selector(".new_user")
  end

  it "does not allow a user to sign up without an email address" do
    visit new_user_path
    fill_in "First name", with: "First"
    fill_in "Last name", with: "Last"
    fill_in "Email", with: ""
    fill_in "Password", with: "Password"
    click_on("Create User")
    expect(page).to have_selector(".new_user")
  end

  it "does not allow a user to sign up without a password" do
    visit new_user_path
    fill_in "First name", with: "First"
    fill_in "Last name", with: "Last"
    fill_in "Email", with: "Fake@fake.com"
    fill_in "Password", with: ""
    click_on("Create User")
    expect(page).to have_selector(".new_user")
  end

end