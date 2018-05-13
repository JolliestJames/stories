class Memory < ApplicationRecord
  belongs_to :user
  belongs_to :story
  validates :name, presence: true
  validates :date, presence: true
  validates :image, presence: true
  
  def update_description(description)
    self.description = description
  end

end