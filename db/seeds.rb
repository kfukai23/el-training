# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

300.times do |n|
    name = Faker::Hacker.verb + rand(21).to_s
    description = Faker::Hacker.say_something_smart
    priority = rand(3)

    statuses = ['未着手', '着手中', '完了']
    pick = rand(3)
    status = statuses[pick]
    deadline = Faker::Date.forward(23)
    user_id = 1

    Task.create!(name: name,
                description: description,
                priority: priority,
                status: status,
                deadline: deadline,
                user_id: user_id
                )
end

# User.create!(name: '匿名', email: 'user@example.com', password_digest: 'digest')

