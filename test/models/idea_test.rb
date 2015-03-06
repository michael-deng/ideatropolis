require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  
  def setup
  	@user = User.new(email: "michael@gmail.com", name: "Michael D", password: "password", password_confirmation: "password")
  	@idea = Idea.new(title: "Random", content: "Lorem ipsum", user_id: @user.id)
  	#@idea = @user.ideas.build(title: "New Idea", content: "Blah blah")
  end

  test "should be valid" do
    assert @idea.valid?
  end

  test "user id should be present" do
    @idea.user_id = nil
    assert_not @idea.valid?
  end
end
