class User < ApplicationRecord
  has_many :stories, dependent: :destroy
  has_many :memories, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  
  # def initialize(first_name, last_name, email, password)
  #   @stories = []
  #   @first_name = first_name
  #   @last_name = last_name
  #   @email = email
  #   @password = password
  # end

  def has_stories?
    self.stories
  end

end