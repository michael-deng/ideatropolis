require 'faker'

FactoryGirl.define do
  factory :idea do
    title { Faker::Lorem.word }
    content { Faker::Lorem.sentence(5) }
    user

    factory :idea_with_comment do
	    after(:create) do |idea|
	      create(:comment, idea: idea)
	    end
	  end
  end
end