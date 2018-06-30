module UserHelpers
  
  def confirm_and_log_in_as(user)
    user.confirm
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button("Log in")
  end

end

RSpec.configure do |c|
  c.include UserHelpers
end