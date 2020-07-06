require "rails_helper"

RSpec.describe Story, type: :model do
  it { should validate_presence_of(:headline) }
  it { should allow_value("sample of headline").for(:headline) }
  it { should_not allow_value("xx").for(:headline).with_message("Should have at least ten characters") }
  it { should validate_presence_of(:status) }
  it { should allow_value("unassigned").for(:status) }
  it { should allow_value("draft").for(:status) }
  it { should allow_value("for_review").for(:status) }
  it { should allow_value("in_review").for(:status) }
  it { should allow_value("pending").for(:status) }
  it { should allow_value("approved").for(:status) }
  it { should allow_value("published").for(:status) }
  it { should allow_value("archived").for(:status) }
  it { should_not allow_value("xx").for(:status) }
  it { should belong_to(:organization).class_name("Organization") }
end
