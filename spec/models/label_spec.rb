require 'rails_helper'

RSpec.describe Label, type: :model do
  describe 'モデルテスト' do
    let(:user) { FactoryBot.create(:user)}
    let(:label) { Label.new(name: name, user_id: user.id)}
    
    before do
      admin = FactoryBot.create(:user, admin: true)
    end

    context 'ラベル名が10文字なら有効であること' do
      let(:name) { '1234567890' }
      it '' do
        expect(label).to be_valid
      end
    end

    context 'ラベル名が11文字なら無効であること' do
      let(:name) { '12345678901' }
      it '' do
        expect(label).not_to be_valid
      end
    end
  end
end