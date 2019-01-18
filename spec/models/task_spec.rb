require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'モデルテスト' do
    before do
      admin = FactoryBot.create(:user, admin: true)
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
        user = User.create(
          name: 'ユーザA',
          email: 'a@example.com',
          password: 'password'
        )
        task = user.tasks.new(
          name: '最初のタスク',
          description: '最初のタスクのdescriptionです',
          priority: 0,
          status: nil,
          deadline: Date.today + 1.days,
        )
        expect(task).not_to be_valid
      end

      it 'ユーザidがなければ無効であること' do
        task = Task.new(
          name: '最初のタスク',
          description: '最初のタスクのdescriptionです',
          priority: 0,
          status: '未着手',
          deadline: Date.today + 1.days,
          user_id: nil
        )
        expect(task).not_to be_valid
      end

      it '名前が31文字を超えると無効であること' do
        user = User.create(
          name: 'ユーザA',
          email: 'a@example.com',
          password: 'password'
        )
        task = user.tasks.new(
          name: '1234567890123456789012345678901',
          description: '最初のタスクのdescriptionです',
          priority: 0,
          status: '未着手',
          deadline: Date.today + 1.days,
        )
        expect(task).not_to be_valid
      end

      it '期限が昨日以前だと無効であること' do
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
          deadline: Date.today - 1.days,
        )
        expect(task).not_to be_valid
      end
    end
  end
end
