class Question < ActiveRecord::Base
  belongs_to :asker, class_name: "User"
  has_many :answers
  has_many :comments, as: :parent
  has_one :best_answer, class_name: "Answer"
  validates :title, presence: true
  validates :content, presence: true
end