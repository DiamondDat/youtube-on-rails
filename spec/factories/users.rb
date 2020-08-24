FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    password { Faker::Internet.password }
    password_confirmation { password }

    trait :with_video do
      after(:create) do |user|
        video = create(:video, user: user, url: 'https://youtu.be/NLOp_6uPccQ')
      end
    end
  end
end
