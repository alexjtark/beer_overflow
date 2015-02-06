class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  has_many :questions
  has_many :answers
  has_many :comments
end