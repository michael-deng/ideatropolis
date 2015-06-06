require 'rails_helper'

RSpec.describe Notification, type: :model do
  it "has a valid factory" do
		expect(build(:notification)).to be_valid
	end

	it { should belong_to(:user) }
  it { should belong_to(:idea) }
  it { should belong_to(:comment) }

  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:idea_id) }
  it { should validate_presence_of(:comment_id) }
end
