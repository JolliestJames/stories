class User
  attr_accessor :memories, :first_name, :last_name, :email, :password

  def initialize(first_name, last_name, email, password)
    @memories = []
    @first_name = first_name
    @last_name = last_name
    @email = email
    @password = password
  end

  def has_memories?
    @memories
  end

end