require 'rails_helper'

# FIXME: 必ず共通化する

describe 'タスク管理機能', type: :system do
    describe '一覧表示機能' do    
        before do
            admin = FactoryBot.create(:user, admin: true)
            user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
            FactoryBot.create(:task, name: "最初のタスク", user: user_a)
        end
    
        context 'ユーザAがログインしているとき' do
            before do
                visit login_path
                fill_in 'メールアドレス',  with: 'a@example.com'
                    fill_in 'パスワード', with: 'password'
                click_button 'ログインする'
            end
        
            it 'ユーザAが作成したタスクが表示される' do 
                expect(page).to have_content '最初のタスク'
            end
        end
    end

    describe '一覧表示機能' do    
        before do
            admin = FactoryBot.create(:user, admin: true)
            user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
            FactoryBot.create(:task, name: "1番目", user: user_a, created_at: Time.current + 2.days )
            FactoryBot.create(:task, name: "2番目", user: user_a, created_at: Time.current + 1.days )
            FactoryBot.create(:task, name: "3番目", user: user_a, created_at: Time.current)
        end
    
        context 'ユーザAがログインしているとき' do
            before do
                visit login_path
                fill_in 'メールアドレス',  with: 'a@example.com'
                    fill_in 'パスワード', with: 'password'
                click_button 'ログインする'
            end
        
            it 'ユーザAが作成したタスクが作成日時の降順に表示される' do 
                within '.table' do
                    task_names = all('.name').map(&:text)
                    expect(task_names).to eq %w(1番目 2番目 3番目) 
                end
            end
        end
    end

    describe '一覧表示機能' do    
        before do
            admin = FactoryBot.create(:user, admin: true)
            user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
            FactoryBot.create(:task, name: "1番目", user: user_a, deadline: Date.today )
            FactoryBot.create(:task, name: "2番目", user: user_a, deadline: Date.today + 1.days )
            FactoryBot.create(:task, name: "3番目", user: user_a, deadline: Date.today + 2.days )
        end
    
        context 'ユーザAがログインしているとき' do
            before do
                visit login_path
                fill_in 'メールアドレス',  with: 'a@example.com'
                    fill_in 'パスワード', with: 'password'
                click_button 'ログインする'
                click_on 'Deadline▲'
            end
        
            it 'ユーザAが作成したタスクが終了期限の昇順に表示される' do 
                within '.table' do
                    task_deadlines = all('.deadline').map(&:text)
                    expect_deadlines = []
                    expect_deadlines << Date.today.to_s
                    expect_deadlines << Date.today.succ.to_s
                    expect_deadlines << Date.today.succ.succ.to_s
                    expect(task_deadlines).to eq expect_deadlines 
                end
            end
        end
    end

    describe '一覧表示機能' do    
        before do
            admin = FactoryBot.create(:user, admin: true)
            user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
            FactoryBot.create(:task, name: "1番目", user: user_a, priority: 2)
            FactoryBot.create(:task, name: "2番目", user: user_a, priority: 1)
            FactoryBot.create(:task, name: "3番目", user: user_a, priority: 0)
        end
    
        context 'ユーザAがログインしているとき' do
            before do
                visit login_path
                fill_in 'メールアドレス',  with: 'a@example.com'
                    fill_in 'パスワード', with: 'password'
                click_button 'ログインする'
                click_on 'Priority▲'
                click_on 'Priority▼'
            end
        
            it 'ユーザAが作成したタスクが優先順位の降順に表示される' do 
                within '.table' do
                    task_names = all('.name').map(&:text)
                    expect(task_names).to eq %w(1番目 2番目 3番目) 
                end
            end
        end
    end

    describe '一覧表示機能' do    
        before do
            admin = FactoryBot.create(:user, admin: true)
            user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
            FactoryBot.create(:task, name: "first", user: user_a, priority: 2, status: "未着手")
            FactoryBot.create(:task, name: "second", user: user_a, priority: 1, status: "着手中")
            FactoryBot.create(:task, name: "third", user: user_a, priority: 0, status: "完了")
        end
    
        context 'ユーザAがログインしているとき' do
            before do
                visit login_path
                fill_in 'メールアドレス',  with: 'a@example.com'
                fill_in 'パスワード', with: 'password'
                click_button 'ログインする'

                fill_in 'Name', with: 'first'
                click_button 'Search'
            end
        
            it 'ユーザAが作成したタスクが優先順位の降順に表示される' do 
                expect(page).to have_content "first"
            end
        end
    end

    describe '一覧表示機能' do    
        before do
            admin = FactoryBot.create(:user, admin: true)
            user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
            FactoryBot.create(:task, name: "first", user: user_a, priority: 2, status: "未着手")
            FactoryBot.create(:task, name: "second", user: user_a, priority: 1, status: "着手中")
            FactoryBot.create(:task, name: "third", user: user_a, priority: 0, status: "完了")
        end
    
        context 'ユーザAがログインしているとき' do
            before do
                visit login_path
                fill_in 'メールアドレス',  with: 'a@example.com'
                fill_in 'パスワード', with: 'password'
                click_button 'ログインする'

                select '高', from: 'Priority'
                click_button 'Search'
            end
        
            it 'ユーザAが作成したタスクが優先順位の降順に表示される' do 
                expect(page).to have_content "first"
            end
        end
    end

    describe '一覧表示機能' do    
        before do
            admin = FactoryBot.create(:user, admin: true)
            user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
            FactoryBot.create(:task, name: "first", user: user_a, priority: 2, status: "未着手")
            FactoryBot.create(:task, name: "second", user: user_a, priority: 1, status: "着手中")
            FactoryBot.create(:task, name: "third", user: user_a, priority: 0, status: "完了")
        end
    
        context 'ユーザAがログインしているとき' do
            before do
                visit login_path
                fill_in 'メールアドレス',  with: 'a@example.com'
                fill_in 'パスワード', with: 'password'
                click_button 'ログインする'

                select '未着手', from: 'Status'
                click_button 'Search'
            end
        
            it 'ユーザAが作成したタスクが優先順位の降順に表示される' do 
                expect(page).to have_content "first"
            end
        end
    end
    
end
