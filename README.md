# README
このアプリケーションは、RubyおよびRuby On Railsによる基本的なWebアプリケーション作成の学習過程において制作されたものです。

### カリキュラム
[株式会社万葉の新入社員教育用カリキュラム https://everyleaf.com/](https://github.com/everyleaf/el-training)

### 参考書籍
[現場で使える Ruby on Rails 5速習実践ガイド](https://www.amazon.co.jp/%E7%8F%BE%E5%A0%B4%E3%81%A7%E4%BD%BF%E3%81%88%E3%82%8B-Ruby-Rails-5%E9%80%9F%E7%BF%92%E5%AE%9F%E8%B7%B5%E3%82%AC%E3%82%A4%E3%83%89-%E5%A4%A7%E5%A0%B4%E5%AF%A7%E5%AD%90/dp/4839962227)

### アプリケーション公開先
https://el-training-koalamask.herokuapp.com/

## Versions
Ruby 2.5.3
Rails 5.2.2

## Deployment instructions
initialize
```
$ heroku login
$ heroku git:remote -a el-training-koalamask
$ git push heroku master
$ heroku run bin/rails db:migrate
```

update
```
$ heroku login
$ git add -A
$ git commit -m "Update application"
$ git push heroku master

* if db had been changed
$ heroku run bin/rails db:migrate
```

## Table Schema

### Tables
| no. | name  |
| --- | ----- |
| 1   | Task  |
| 2   | Label |
| 3   | User  |


### Task Table
| column_name | data_type | not_null | default | auto increment | index | comments                                       |
| ----------- | --------- | -------- | ------- | -------------- | ----- | ---------------------------------------------- |
| task_id     | integer   | true     |         |                |       |                                                |
| name        | string    | true     |         |                |       | [validation] until 30 characters               |
| priority    | integer   |          |         |                |       |                                                |
| description | text      |          |         |                |       |                                                |
| status      | integer   | true     | 0       |                |       | [use enum] 0: not yet, 1: in progress, 2: done |
| label_id    | integer   |          |         |                |       |                                                |
| user_id     | integer   |          |         |                |       | will be not_null after login function added    |
| deadline    | date      |          |         |                |       | [validation] should be today or later          |
| created_at  |           |          |         |                |       |                                                |
| updated_at  |           |          |         |                |       |                                                |


### Label Table
| column_name | data_type | not_null | default | auto increment | index | comments |
| ----------- | --------- | -------- | ------- | -------------- | ----- | -------- |
| label_id    | integer   | true     |         |                |       |          |
| name        | string    | true     |         |                |       |          |
| color       | string    | true     |         |                |       |          |
| created_at  |           |          |         |                |       |          |
| updated_at  |           |          |         |                |       |          |


### User Table
| column_name     | data_type | not_null | default | auto increment | comments                                | index |
| --------------- | --------- | -------- | ------- | -------------- | --------------------------------------- | ----- |
| user_id         | integer   | true     |         |                |                                         |       |
| name            | string    | true     |         |                |                                         |       |
| email           | string    | true     |         |                | [validation] should be based on RFC2822 |       |
| password_digest | string    | true     |         |                |                                         |       |
| is_unsubscribed | boolean   | true     | false   |                |                                         |       |
| created_at      |           |          |         |                |                                         |       |
| updated_at      |           |          |         |                |                                         |       |


## Project Schedule:
https://docs.google.com/spreadsheets/d/1Dm5GPaeZZ2hnU8SnUpZlDOZFFXtPF6fCtXM-2Nrud2A/edit#gid=0
