FactoryBot.define do
  factory :bug do
    title { Faker::Lorem.words }
    description { Faker::Lorem.sentence }
    status {'New'}
    type {'Bug'}
    deadline {'03-03-2019'}
    association :project, factory: :project
    association :creator, factory: :user
    association :solver, factory: :user
  end
end