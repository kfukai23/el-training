require 'rails_helper'

describe 'タスク管理機能', type: :system do
    describe '一覧表示機能' do
        before do
        end
        
        context '最初のタスクが存在しているとき'    
            before do
                FactoryBot.create(:task)
                visit tasks_path
            end

            it '最初のタスクが表示される' do 
                expect(:page).to have_content '最初のタスク'
            end
        end
    end
end

# describe 'タスク管理機能', type: :system do
    #     describe '一覧表示機能' do    
    #         before do
    #             user_a = FactoryBot.create(:user)
    #             FactoryBot.create(:task, name: "最初のタスク", user: user_a)
    #         end
        
    #     context 'ユーザAがログインしているとき'
    #         before do
    #             visit login_path
    #             fill_in 'メールアドレス',  with 'a@example.com'
    #             fill_in 'パスワード', with 'password'
    #             click_button 'ログインする'
    #         end
        
    #         it 'ユーザAが作成したタスクが表示される' do 
    #             # 作成済みのタスク名が表示される
    #         end
