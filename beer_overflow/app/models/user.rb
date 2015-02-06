class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  has_many :questions, foreign_key: :asker_id
  has_many :answers, foreign_key: :responder_id
  has_many :comments, foreign_key: :author_id
end