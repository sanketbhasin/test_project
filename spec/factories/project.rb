FactoryBot.define do
  factory :project do
    title { Faker::Lorem.words }
    description { Faker::Lorem.sentence }
    manager_id { create(:user).id } 
  end
end