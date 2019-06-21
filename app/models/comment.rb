class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  belongs_to :image

  validates :context, :user_id, presence: true
end
