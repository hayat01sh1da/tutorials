# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

owner = User.create!(
  image_url: 'https://avatars.githubusercontent.com/u/37478830',
  name: 'hayat01sh1da',
  provider: 'github',
  uid: rand(10**(8-1)..10**8-1).to_s
)

1.upto(500) do |i|
  Event.create!(
    name: "Event#{sprintf('%03d', i)}",
    place: 'Tokyo',
    content: 'This is a sample event.',
    start_at: Time.zone.now.since(1.year),
    end_at: Time.zone.now.since(1.year).since(3.hours),
    owner:
  )
end
