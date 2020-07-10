class Comment < ApplicationRecord
  validates :body, presence: true

  belongs_to :story
  belongs_to :user
end
