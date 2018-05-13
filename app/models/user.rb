class User < ApplicationRecord
  has_many :stories, dependent: :destroy
  has_many :memories, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true

  def add_story(story)
    self.stories << story
  end

end