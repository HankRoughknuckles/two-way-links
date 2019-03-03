FactoryBot.define do
  factory :resource do
    association :website, domain_and_suffix: 'www.example.com'
    url { 'http://www.example.com/foo' }
  end
end
