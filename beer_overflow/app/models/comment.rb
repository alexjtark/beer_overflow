class Comment < ActiveRecord::Base
  validates :content, presence: true
  belongs_to :author, class_name: "User"
  belongs_to :parent, polymorphic: true
  has_many :votes, as: :votable

  def vote_count
    up = votes.where(liked: true).count
    down = (-1) * votes.where(liked: false).count
    return (up + down)
  end
end