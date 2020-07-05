class Organization < ApplicationRecord
  validates :slug, presence: true, uniqueness: true, format: { with: /[a-z0-9]{3,10}/, message: "Bad Format" }, length: { minimum: 3, maximum: 10, message: "Should have at least three letters and ten at maximum" }
  validates :name, presence: true, length: { minimum: 3, message: "Should have at least three letters" }

  before_save :downcase_slug

  def downcase_slug
    self.slug.downcase!
  end
end
