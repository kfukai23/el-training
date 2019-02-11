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
	person_name_items = ["日村", "設楽", "伊達", "富澤", "天野", "鈴木"]
	person_name = person_name_items[rand(0..6)]

	project_name_items = ["Taskleaf", "かるた読み札アプリ", "汎用ポイント処理システム"]
	project_name = project_name_items[rand(0..2)]

	task_proto = [
		{ name: "来月の朝会のテーマを設定する",								description: "候補：日々の悩みごと、その日やること、共有事項など"},
		{ name: "来月の朝会のスケジューリング",								description: "水・金が望ましい。週の実施回数は別途MTGで決めること"},
		{ name: "MTGの出欠を取る",												 description: "対象者は技術開発部門メンバーのみ"},
		{ name: "MTGのレジュメを作成する",				 					description: "議題、目的、議論したい点を明確にすること"},
		{ name: "MTGの議事録をUPする",					  		 		 description: "まず社長に見せてからUPすること"},
		
		{ name: "MTGのふりかえりKPTを実施する",				       description: "やるかどうか園田さんに意見を聞いてからのほうが良いかもしれない"},
		{ name: "#{person_name}さんとの1on1日時を設定する",	 description: "何か話したいことがないか本人に聞くのも忘れずに"},
		{ name: "#{person_name}さんとの1on1振り返り資料作成",description: "・メモ：1)実装上の困る点を相談できる人が周りにいない 2)仕事自体には満足しており楽しんで取り組めている 3)もっと社内清掃を徹底できるルールがほしい"},
		{ name: "#{project_name} PJ チケット発行", 		   	 description: "リリース予定日： 6月30日"},
		{ name: "#{project_name} PJ PRレビュー",			    description:"約10件"},
		
		{ name: "会社ブログに記事UP", 						    			description: "TECHメモから原案を探してブラッシュアップする"},
		{ name: "会社ブログ記事の原案をブレストする",       	 description: "#{person_name}さんと一緒にやる"},
		{ name: "会社ブログのAdventCalenderのテーマ決め",		 description: "#{person_name}さんに意見を聞いてから"},
		{ name: "社内LT大会のテーマを設定する",               description: "・RailsDMで発表された内容について ・4月を迎えて思うこと などなど"},
		{ name: "#{person_name}さんの送別会出欠確認",        description: "東京オフィスの全員に声掛け 休職中の#{person_name}さんはどうするか一度軽く打ち合わせる"},
		
		{ name: "送別会のお店を予約する", 							 	  	description: "富士見台駅前の焼肉店 https://tabexxx.com/tokyo/xxxxxx/xxxx/ 03-xxxx-xxxx"},
		{ name: "有給申請する",											  	    description: "4/4午後 通院のため"},
		{ name: "夏季休暇日程調整",											     description: "7月上旬を第一希望とする"},
		{ name: "#{person_name}さん一次面接日程調整",					description: "応募書類一式： https://googledrive.com/xxxxx/xxxxx"},
		{ name: "#{person_name}さん二次面接日程調整",  				description: "応募書類・一次面接評価結果： https://googledrive.com/xxxxx/xxxxx"},
		
		{ name: "#{person_name}さん二次面接評価シート記入", 	 description: "応募書類・一次面接評価結果： https://googledrive.com/xxxxx/xxxxx"},
		{ name: "#{person_name}さん3Q評価シートにコメント記入",description: "評価シート置き場: https://googledrive.com/xxxxx/xxxxx"}]
	
	statuses = ['未着手', '着手中', '完了']
	task = task_proto[rand(0..21)]
	task["status"] = statuses[rand(0..2)]
	task["deadline"] = Faker::Date.forward(23)
	task["priority"] = rand(0..2)
	task["user_id"] = rand(1..3)

	Task.create!(task)
end

