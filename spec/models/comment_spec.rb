require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "has a valid factory" do
  	expect(build(:comment)).to be_valid
  end

  it "is invalid without content" do
  	expect(build(:comment, content: nil)).to_not be_valid
  end
end
