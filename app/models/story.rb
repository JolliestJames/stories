class Story < ApplicationRecord
  belongs_to :user
  has_many :memories, dependent: :destroy
  validates_presence_of :name, :description
  validates_length_of :name, minimum: 1, maximum: 50, on: :create
  validates_length_of :description, minimum: 1, maximum: 1024, on: :create

  def add_memory(memory)
    self.memories << memory
  end

end