FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    user_type { 'Manager' }

    trait :qa do
      user_type { 'QA' }
    end

    trait :developer do
      user_type { 'Developer' }
    end   
    factory :qa_user,   :traits => [:qa] 
    factory :developer_user,    :traits => [:developer] 
  end
end