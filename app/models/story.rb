class Story < ApplicationRecord
  validates :headline, presence: true, length: { minimum: 10, message: "Should have at least ten characters" }
  validates :status, presence: true, inclusion: { in: %w(unassigned draft for_review in_review pending approved published archived) }
  belongs_to :organization
  belongs_to :writer, optional: true
  belongs_to :reviewer, optional: true
end
