require 'rails_helper'

describe 'ユーザー機能', type: :system do
  let(:admin_user_a){ FactoryBot.create(:user, name: 'admin_user', email: 'admin_user_a@example.com', admin: true) }

  describe '管理者機能' do
    before do
      visit login_path
      fill_in 'メールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      click_button 'ログインする'
    end

    describe 'ユーザー編集' do
      let(:login_user) { admin_user_a }

      context '管理者ユーザーが自分ひとりのとき' do
        it '管理者権限を外せないこと' do
          # 管理者ページに行く
          visit edit_admin_user_path(admin_user_a)
          # 管理者権限チェックを外す
          uncheck 'form-label-input'
          # 登録ボタンを押す
          click_button '登録する'
          expect(page).to have_content '管理者ユーザーが0人になるため変更できません'
        end

        it '削除ができないこと' do
          visit admin_user_path(admin_user_a)
          # 登録ボタンを押す
          accept_confirm { click_on '削除' }
          expect(page).to have_content '管理者ユーザーが0人になるため変更できません'
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