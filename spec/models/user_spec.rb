require "rails_helper"

RSpec.describe User, type: :model do
  subject { User.new(email: "some@email.com", password: "123456", role: "editor", organization: Organization.new(name: "some name", slug: "slug")) }
  it { should validate_presence_of(:email) }
  it { should allow_value("xpto@xpto.com").for(:email) }
  it { should_not allow_value("xx").for(:email).with_message("Bad Format") }
  it { should validate_uniqueness_of(:email).case_insensitive }

  it { should allow_value("123456").for(:password) }
  it { should_not allow_value("xx").for(:password).with_message("Should have at least six characters") }

  it { should validate_presence_of(:role) }
  it { should allow_value("editor").for(:role) }
  it { should allow_value("writer").for(:role) }
  it { should_not allow_value("xx").for(:role) }

  it { should belong_to(:organization).class_name("Organization") }
end
