class User < ApplicationRecord
  has_many :stories, dependent: :destroy
  has_many :memories, dependent: :destroy
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates_presence_of :username, :email, :password
  validates_length_of :username, minimum: 1, maximum: 50, on: :create
  validates_length_of :email, minimum: 1, maximum: 255, on: :create
  validates_length_of :password, minimum: 7, maximum: 255, on: :create
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates_uniqueness_of :username, :email, case_sensitive: false

  def add_story(story)
    self.stories << story
  end

end