FactoryGirl.define do
  factory :user_conversation do
    user nil
    conversation nil
  end
  factory :conversation do
    
  end
  factory :user do
    sequence(:name) {|n| "John#{n}"}
    sequence(:email) {|n| "#{n}user@gmail.com"}
    password "asdfasdf"
  end

  factory :comment do
    body Faker::Lorem.paragraph(1, true, 3)
    user
    post
  end

  factory :post do
    body Faker::Lorem.paragraph(3, true, 30)
    association :user, factory: :user

    factory :post_with_comments do
      transient do
        comments_count 5
      end

      after(:create) do |post, evaluator|
        create_list(:comment, evaluator.comments_count, post: post)
      end

    end
  end

end
