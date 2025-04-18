# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create do |user|
  user.name = 'Oasist'
  user.email = 'sample@example.com'
  user.password = 'hogehogefoobar'
  user.password_confirmation = 'hogehogefoobar'
end

1.upto(30).map do |t_id|
  Todo.create do |todo|
    todo.title = "Todo#{sprintf("%03d", t_id)}"
    todo.user = user
    30.times do |i_id|
      Item.create do |item|
        item.name = "Item#{sprintf("%03d", i_id)}"
        item.done = false
        item.todo = todo
      end
    end
  end
end
