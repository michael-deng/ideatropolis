require 'faker'

FactoryGirl.define do
	factory :comment do
    content { Faker::Lorem.sentence(5) }
    user
    idea
  end
end