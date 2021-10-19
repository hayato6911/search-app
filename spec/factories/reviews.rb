FactoryBot.define do
    factory :review do
      association :location
      association :user
      score                         {'3'}
    end
    trait :score do
        score {}
    end
    trait :content do
        content {}
    end
    trait :location_id do
        location_id {}
    end
    trait :user_id do
        user_id {}
    end
  end
