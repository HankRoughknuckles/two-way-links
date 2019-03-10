FactoryBot.define do
  factory :resource do
    association :website, domain_and_suffix: 'www.example.com'
    sequence(:url) { |n| "http://www.example.com/foo#{n}" }
  end
end
