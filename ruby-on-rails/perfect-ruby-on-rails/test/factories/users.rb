FactoryBot.define do
  factory :user, aliases: [:owner] do
    provider { 'github' }
    sequence(:uid) { it }
    sequence(:name) { "ユーザー#{format('%03d', it)}" }
    sequence(:image_url) { "http://example.com/image_#{it}.jpg" }
  end
end
