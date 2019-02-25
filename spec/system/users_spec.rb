require 'rails_helper'

describe 'ユーザー機能', type: :system do
  let!(:admin_user_a){ FactoryBot.create(:user, name: 'admin_user', email: 'admin_user_a@example.com', admin: true) }
  let!(:user_a){ FactoryBot.create(:user, name: 'test_user_a', email: 'test_user_a@example.com', admin: false) }

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
          visit edit_admin_user_path(admin_user_a)
          uncheck 'form-label-input'
          click_button '登録する'
          expect(page).to have_content '管理者ユーザーが0人になるため変更できません'
        end

        it '削除ができないこと' do
          visit admin_user_path(admin_user_a)
          accept_confirm { click_on '削除' }
          expect(page).to have_content '管理者ユーザーが0人になるため変更できません'
        end
      end
    end
      
    describe '管理者メニュー' do
      let(:login_user) { user_a }
      
      context '管理者以外のユーザーがアクセスしたとき' do
        it '管理者メニューを表示できないこと' do
          visit admin_users_path
          expect(page).to have_content 'お探しのページは見つかりませんでした。'
        end
      end
    end   
  end
end