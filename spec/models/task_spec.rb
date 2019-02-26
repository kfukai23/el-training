require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'モデルテスト' do
    let(:user) { User.create(name: 'ユーザA', email: 'a@example.com', password: 'password') }

    before do
      admin = FactoryBot.create(:user, admin: true)
    end

    context 'name, description, priority, status, deadline, user_idが揃っていたら保存されること' do
      let(:task) { FactoryBot.create(:task) }
      it '' do
        expect(task).to be_valid
      end
    end
    
    context 'ステータスがなければ無効であること' do
      let(:task){ FactoryBot.build(:task, status: nil) }
      it '' do
        expect(task).not_to be_valid
      end
    end

    context 'ユーザidがなければ無効であること' do
      let(:task){ FactoryBot.build(:task, user_id: nil) }
      it '' do
        expect(task).not_to be_valid
      end
    end

    context '名前が31文字を超えると無効であること' do
      let(:task){ FactoryBot.build(:task, name: '1234567890123456789012345678901') }
      it '' do
        expect(task).not_to be_valid
      end
    end

    context '名前が30文字ならば有効であること' do
      let(:task){ FactoryBot.build(:task, name: '123456789012345678901234567890') }
      it '' do
        expect(task).to be_valid
      end
    end

    context '期限が昨日以前だと無効であること' do
      let(:task) { FactoryBot.build(:task, deadline: Date.today - 1.days) }
      it '' do
        expect(task).not_to be_valid
      end
    end

    context '期限が今日ならだと有効であること' do
      let(:task) { FactoryBot.build(:task, deadline: Date.today) }
      it '' do
        expect(task).to be_valid
      end
    end
  end
end
