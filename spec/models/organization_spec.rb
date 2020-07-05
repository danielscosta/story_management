require "rails_helper"

RSpec.describe Organization, type: :model do
  subject { Organization.new(name: "some name", slug: "slug") }
  it { should validate_presence_of(:slug) }
  it { should validate_uniqueness_of(:slug) }
  it { should allow_value("xpto").for(:slug) }
  it { should_not allow_value("xx?").for(:slug).with_message("Bad Format") }
  it { should_not allow_value("xx").for(:slug).with_message("Should have at least three letters and ten at maximum") }
  it { should_not allow_value("xpto1234567").for(:slug).with_message("Should have at least three letters and ten at maximum") }
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_least(3).with_message("Should have at least three letters") }
end
