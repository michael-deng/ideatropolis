require 'faker'

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    password { Faker::Internet.password(10, 20) }

    factory :user_with_idea do
	    after(:create) do |user|
	      create(:idea, user: user)
	    end
	  end

    factory :user_with_comment do
      after(:create) do |user|
        create(:comment, user: user)
      end
    end
  end  
end
