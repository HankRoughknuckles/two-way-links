FactoryBot.define do
  factory :link do
    association :subscriber, factory: :resouce
    association :target, factory: :resouce
  end
end
