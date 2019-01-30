# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name:'test_user_a', email:'test_user_a@example.com', password:'password', admin: true)
User.create(name:'test_user_b', email:'test_user_b@example.com', password:'password', admin: true)
User.create(name:'test_user_c', email:'test_user_c@example.com', password:'password', admin: false)


100.times do |n|
    names = ['〇〇さんにメールを送る',
            'プレゼン資料をPMに提出する',
            '出張のホテルを手配する',
            'el-trainingのコードレビューをする',
            '交通費を申請する',
            'アポイントを取る',
            'MTGの会議室を予約する',
            '採用応募者の書類に目を通す',
            '全社会議での発表内容原案を作成する',
            '〇〇さんとの1on1実施日時を設定する']

    description = Faker::Hacker.say_something_smart

    statuses = ['未着手', '着手中', '完了']
    deadline = Faker::Date.forward(23)

    Task.create(name: names[rand(11)],
                description: description,
                priority: rand(2),
                status: statuses[rand(2)],
                deadline: deadline,
                user_id: rand(2)
                )
end

# User.create!(name: '匿名', email: 'user@example.com', password_digest: 'digest')

