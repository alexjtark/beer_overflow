class Vote < ActiveRecord::Base
  validates_uniqueness_of :user_id, :scope => [:votable_id, :votable_type]
  belongs_to :user
  belongs_to :votable, polymorphic: true
end