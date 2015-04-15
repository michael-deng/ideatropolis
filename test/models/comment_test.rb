require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  def setup
  	@user = User.new(email: "example2@gmail.com", name: "Michael D", password: "password", password_confirmation: "password")
    @user.save
  	@idea = @user.ideas.build(title: "New Idea", content: "Blah blah")
  	@comment = @idea.comments.build(content: "New content")
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "user id should be present" do
    @comment.user_id = nil
    assert_not @comment.valid?
  end

  test "idea id should be present" do
    @comment.idea_id = nil
    assert_not @comment.valid?
  end

  test "content should be present " do
    @comment.content = "   "
    assert_not @comment.valid?
  end

  test "content should be at most 140 characters" do
    @comment.content = "a" * 141
    assert_not @comment.valid?
  end
end
