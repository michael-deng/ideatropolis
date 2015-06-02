require 'rails_helper'

RSpec.describe User, type: :model do
	it "has a valid factory" do
		expect(build(:user)).to be_valid
	end

  it { should have_many(:ideas) }
  it { should have_many(:comments) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it "is invalid if name exceeds 50 letters" do
  	expect(build(:user, name: "a"*51)).to_not be_valid
  end

  it "is invalid if email exceeds 256 letters" do
  	expect(build(:user, email: "a"*244+"@example.com")).to_not be_valid
  end

  it "accepts valid email addresses" do
  	valid_addresses = %w[USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      expect(build(:user, email: valid_address)).to be_valid
    end
  end

  it "rejects invalid email addresses" do
  	invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      expect(build(:user, email: invalid_address)).to_not be_valid
    end
  end

  it "has unique email addresses" do
  	user = build(:user)
  	duplicate = user.dup
  	user.save
  	expect(duplicate).to_not be_valid
  end

  it "saves email addresses as lowercase" do
  	mixed_case_email = "Foo@ExAMPle.CoM"
  	user = create(:user, email: mixed_case_email)
  	expect(user.reload.email).to be == mixed_case_email.downcase
  end

  it "is invalid if password has less than 8 letters" do
  	expect(build(:user, password: "pssword")).to_not be_valid
  end

  it "destroys its associated ideas if it is destroyed" do
  	user = create(:user_with_idea)
  	expect { user.destroy }.to change { Idea.count }.by(-1)
  end

  it "destroys its associated comments if it is destroyed" do
    user = create(:user_with_comment)
    expect { user.destroy }.to change { Comment.count }.by(-1)
  end
end
