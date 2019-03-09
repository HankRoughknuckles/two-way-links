FactoryBot.define do
  factory :link do
    association :subscriber, factory: :resource
    association :target, factory: :resource
  end
end
