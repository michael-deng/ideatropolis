require 'rails_helper'

RSpec.describe Idea, type: :model do
  it "has a valid factory" do
  	expect(build(:idea)).to be_valid
  end

  it { should belong_to(:user) }
  it { should have_many(:comments) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:user_id) }

  it "destroys its associated comments if it is destroyed" do
  	idea = create(:idea_with_comment)
  	expect { idea.destroy }.to change { Comment.count }.by(-1)
  end
end
