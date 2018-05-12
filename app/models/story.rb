class Story
  attr_accessor :memories, :name, :description

  def initialize(name, description)
    @memories = []
    @name = name
    @description = description
  end

  def add_memory(memory)
    @memories << memory
  end

end