require 'faker'

FactoryGirl.define do
	factory :notification do
    content { "Michael Deng posted a comment" }
    user
    idea
    comment
  end
end