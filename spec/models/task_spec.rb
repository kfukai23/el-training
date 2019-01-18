require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'モデルテスト' do
    before do
      admin = FactoryBot.create(:user, admin: true)
      # user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
    end

    context '' do
        it 'name, description, priority, status, deadline, user_idが揃っていたら保存されること' do
          user = User.create(
            name: 'ユーザA',
            email: 'a@example.com',
            password: 'password'
          )
          task = user.tasks.new(
            name: '最初のタスク',
            description: '最初のタスクのdescriptionです',
            priority: 0,
            status: '未着手',
            deadline: Date.today + 1.days,
          )
          expect(task).to be_valid
        end

        it 'ステータスがなければ無効であること' do
        end

        it 'ユーザidがなければ無効であるｋとおと' do
        end
    end
  end
end
