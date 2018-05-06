class User
  attr_accessor :memories

  def initialize
    @memories = []
  end

  def has_memories?
    @memories
  end

end