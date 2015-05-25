require 'rails_helper'

RSpec.describe Idea, type: :model do
  it "has a valid factory" do
  	expect(build(:idea)).to be_valid
  end

  it "is invalid without a title" do
  	expect(build(:idea, title: nil)).to_not be_valid
  end

  it "is invalid without content" do
  	expect(build(:idea, content: nil)).to_not be_valid
  end

  it "is invalid without user_id" do
  	expect(build(:idea, user_id: nil)).to_not be_valid
  end

  it "destroys its associated comments if it is destroyed" do
  	idea = create(:idea_with_comment)
  	expect { idea.destroy }.to change { Comment.count }.by(-1)
  end
end
