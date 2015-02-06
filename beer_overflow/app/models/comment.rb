class Comment < ActiveRecord::Base
  validates :content, presence: true
  belongs_to :author, class_name: "User"
  belongs_to :parent, polymorphic: true
end