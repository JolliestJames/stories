class Memory
  attr_accessor :name, :date, :image, :description

  def initialize(name, date, image, description)
    @name = name
    @date = date
    @image = image
    @description = description
  end

  def update_description(description)
    @description = description
  end

end