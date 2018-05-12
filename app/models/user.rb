class User
  attr_accessor :stories, :first_name, :last_name, :email, :password

  def initialize(first_name, last_name, email, password)
    @stories = []
    @first_name = first_name
    @last_name = last_name
    @email = email
    @password = password
  end

  def has_stories?
    @stories
  end

end