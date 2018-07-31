module UserHelpers
  
  def log_in_as(user)
    visit login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button("Log in")
  end

  def save(object)
    object.save
  end

end

RSpec.configure do |c|
  c.include UserHelpers
end