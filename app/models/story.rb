class Story < ApplicationRecord
  belongs_to :user
  has_many :memories, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true

  def add_memory(memory)
    self.memories << memory
  end

end