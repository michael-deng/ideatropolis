require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  
  def setup
  	@user = User.new(email: "example@gmail.com", name: "Michael D", password: "password", password_confirmation: "password")
    @user.save
  	@idea = @user.ideas.build(title: "New Idea", content: "Blah blah")
  end

  test "should be valid" do
    assert @idea.valid?
  end

  test "user id should be present" do
    @idea.user_id = nil
    assert_not @idea.valid?
  end

  test "title should be present " do
    @idea.title = "   "
    assert_not @idea.valid?
  end

  test "title should be at most 50 characters" do
    @idea.title = "a" * 51
    assert_not @idea.valid?
  end

  test "content should be present " do
    @idea.content = "   "
    assert_not @idea.valid?
  end

  test "content should be at most 140 characters" do
    @idea.content = "a" * 141
    assert_not @idea.valid?
  end

  test "order should be most recent first" do
    assert_equal Idea.first, ideas(:most_recent)
  end
end
