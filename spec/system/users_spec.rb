require 'rails_helper'

describe 'ユーザー機能', type: :system do
  describe '管理者機能' do
    describe 'ユーザー編集' do
      context '管理者ユーザーが自分ひとりのとき' do
        it '管理者権限を外せないこと' do
          #FIXME
        end
      end
    end

    describe 'ユーザー削除' do
      context '管理者ユーザーが自分ひとりのとき' do
        it '削除ができないこと' do
          #FIXME
        end
      end
    end

    describe '管理者メニュー' do
      context '管理者以外のユーザーがアクセスしたとき' do
        it '管理者メニューを表示できないこと' do
          #FIXME
        end
      end

      context '管理者以外のユーザーがCRUDを試みたとき' do
        it 'エラーになること' do
          #FIXME
        end
      end
    end
  end
end