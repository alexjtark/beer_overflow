class Question < ActiveRecord::Base
  belongs_to :asker, class_name: "User"
  has_many :answers, dependent: :destroy
  has_many :comments, as: :parent
  belongs_to :best_answer, class_name: "Answer"
  has_many :votes, as: :votable

  validates :title, presence: true
  validates :content, presence: true
  validates :asker_id, presence: true


  def order_answers
    ordered_answers = []
    answers = self.answers

    if self.best_answer
      best = self.best_answer
      ordered_answers << best

      self.answers.each do |answer|
        unless answer == self.best_answer
          ordered_answers << answer
        end
      end
      return ordered_answers
    else
      answers
    end
  end

  def self.all_by_date
    Question.all.order(created_at: :desc)
  end

  def date_posted
    self.created_at.strftime("%D %R %Z")
  end

  def vote_count
    votes.where(liked: true).count - votes.where(liked: false).count
  end

end