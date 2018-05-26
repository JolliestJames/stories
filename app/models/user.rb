class User < ApplicationRecord
  has_many :stories, dependent: :destroy
  has_many :memories, dependent: :destroy
  
  validates :user_name, :email, :password, presence: true
  validates :user_name, :email, uniqueness: { case_sensitive: false }

  def add_story(story)
    self.stories << story
  end

end