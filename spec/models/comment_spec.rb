require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "has a valid factory" do
  	expect(build(:comment)).to be_valid
  end

  it { should belong_to(:user) }
  it { should belong_to(:idea) }

  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:idea_id) }

  it "is invalid if content exceeds 140 letters" do
  	expect(build(:comment, content: "a"*141)).to_not be_valid
  end
end
