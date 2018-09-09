class Memory < ApplicationRecord
  mount_uploader :image, MemoryUploader

  belongs_to :user
  belongs_to :story

  validates_integrity_of :image
  validates_processing_of :image
  validates_presence_of :name, :date, :image, :description
  validates_length_of :name, minimum: 1, maximum: 255, on: :create
  validates_length_of :description, minimum: 1, maximum: 255, on: :create
  
  def update_description(description)
    self.description = description
  end
end