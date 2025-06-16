FactoryBot.define do
  factory :event do
    owner
    sequence(:name) { "#{Event.human_attribute_name(:name)}_#{format('%03d', it)}" }
    sequence(:place) { "#{Event.human_attribute_name(:place)}_#{format('%03d', it)}" }
    sequence(:content) { "#{Event.human_attribute_name(:content)}_#{format('%03d', it)}" }
    start_at { rand(1..30).days.from_now }
    end_at { start_at + rand(1..30).hours }
  end
end
