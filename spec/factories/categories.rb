require 'faker'

FactoryGirl.define do
	factory :category do
    name { Faker::Lorem.sentence(1) }
    user
    idea
  end
end